class Access < Sinatra::Base

	set :root, File.dirname('../')
	use Rack::Session::Cookie, :expire_after => 2592000  #TODO: Get this working for Pool
	set :session_secret, "kartik" #Else each time a random session secret will be created which will fail the cookie mechanism
	#TODO: Remove cookie on logout
	
	Warden::Strategies.add(:password) do
		def valid?
			params['username']||params['password']
		end
		def authenticate! 
			u = User.authenticate(params['username'], params['password'])
			u.nil? ? fail!("Could not login") : success!(u)
		end
	end

	use Warden::Manager do |manager|
		manager.default_strategies :password
		manager.failure_app = Access
	end

	Warden::Manager.serialize_into_session{|user| user.id}
	Warden::Manager.serialize_from_session{|id| User.get(id)}

	
	get '/' do
		env['warden'].authenticate!
		'Up!'
	end

	get '/enter-word' do
		env['warden'].authenticate!
		haml :enter_word
	end

	post '/store-word' do
		session[:new] = [] if session[:new].nil?
		session[:new]<<Word.add_word(params)
		redirect to('/enter-word')
	end

	post '/unauthenticated' do
		uri = env['REQUEST_URI']
		env['rack.session'][:return_to] = env['warden.options'][:attempted_path]
		[302, {'Location' => '/login'}, '']
	end

	get '/login/?' do
		haml :login
	end

	post '/login/?' do
		env['warden'].authenticate!
		redirect env['rack.session'][:return_to]
	end

	get '/logout/?' do
		env['warden'].logout
		redirect '/login'
	end


end
