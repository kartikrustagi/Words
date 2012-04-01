path = File.dirname(__FILE__)

Dir["#{path}/*.rb"].each{|file|
	if file != "#{path}/init.rb"
		require file
	end
}
