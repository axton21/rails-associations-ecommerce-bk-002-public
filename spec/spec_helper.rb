ENV["ACTIVE_RECORD_ENV"] = "test"

require_relative '../config/environment'
require 'rack/test'

if defined?(ActiveRecord::Migrator) && ActiveRecord::Migrator.needs_migration?
  raise 'Migrations are pending run `rake db:migrate ACTIVE_RECORD_ENV=test` to resolve the issue.'
end

RSpec.configure do |config|
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
  config.order = 'default'
end

def read_file(file_name)
  file = File.open(file_name, "r")
  data = file.read
  file.close
  return data
end