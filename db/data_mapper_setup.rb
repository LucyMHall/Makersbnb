require 'data_mapper'
require 'dm-postgres-adapter'

# this app name will be the prefix to the database
APP_NAME = 'makers_bnb'

require_relative '../lib/booking.rb'
require_relative '../lib/user.rb'
require_relative '../lib/space.rb'


DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/#{APP_NAME}_#{ENV['RACK_ENV']}")

#This checks the models for validity and initializes all properties associated with relationships.
DataMapper.finalize

#create tables if they don't exist
DataMapper.auto_upgrade!
