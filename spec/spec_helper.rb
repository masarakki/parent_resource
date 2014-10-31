# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'
require File.expand_path('../dummy/config/environment.rb',  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path('../dummy/db/migrate', __FILE__)]
require 'rspec/rails'
require 'coveralls'
Coveralls.wear!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

ActiveRecord::Migration.maintain_test_schema!
