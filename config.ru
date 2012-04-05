require "rubygems"
require "bundler/setup"

path = File.expand_path("../",__FILE__)
$LOAD_PATH.unshift(".") unless $LOAD_PATH.include?(".")

require 'db/db_config.rb'
require 'db/models/init.rb'
require 'routes/init.rb'

run Access
