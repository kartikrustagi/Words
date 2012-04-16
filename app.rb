require "bundler/setup"
require "sequel"
require "openssl"

require_relative 'db/db_config.rb'
require_relative 'db/models/init.rb'
require_relative 'lib/init.rb'

signup("username","password")
#populate_words
