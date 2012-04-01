class Access < Sinatra::Base

	set :root, File.dirname('../')

	get '/' do
		'Up!'
	end

	get '/enter-word' do
		haml :enter_word
	end

	post '/store-word' do
		Word.add_word(params)
		redirect to('/enter-word')
	end

end
