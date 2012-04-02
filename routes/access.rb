class Access < Sinatra::Base

	set :root, File.dirname('../')
	use Rack::Session::Cookie, :expire_after => 2592000  #TODO: Get this working for Pool
	#TODO: Remove cookie on logout
	set :session_secret, "kartik" #Else each time a random session secret will be created which will fail the cookie mechanism

	get '/' do
		puts session[:new]
		'Up!'
	end

	get '/enter-word' do
		haml :enter_word
	end

	post '/store-word' do
		session[:new] = [] if session[:new].nil?
		session[:new]<<Word.add_word(params)
		redirect to('/enter-word')
	end

end
