class Access < Sinatra::Base

	set :root, File.dirname('../')

	get '/' do
		'Up!'
	end

	get '/enter-word' do
		haml :enter_word
	end
		

end
