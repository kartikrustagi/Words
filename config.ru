require 'sinatra/base'
require 'Haml'

path = File.expand_path("../",__FILE__)
$LOAD_PATH.unshift(".") unless $LOAD_PATH.include?(".")

require 'db/db_config.rb'
require 'routes/init.rb'

run Access
