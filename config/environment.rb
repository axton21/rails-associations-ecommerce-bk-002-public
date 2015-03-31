ENV['ACTIVE_RECORD_ENV'] ||= "development"

require "bundler/setup"

require 'active_record'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/ecommerce_#{ENV['ACTIVE_RECORD_ENV']}.sqlite"
)
