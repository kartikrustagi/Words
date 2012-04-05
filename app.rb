require "bundler/setup"

require_relative 'db/db_config.rb'
require_relative 'db/models/init.rb'
require_relative 'routes/init.rb'
require_relative 'lib/populate.rb'

populate_words
