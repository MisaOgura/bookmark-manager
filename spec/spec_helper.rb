ENV['RACK_ENV'] = 'test'

require './app/models/link'
require 'capybara'
require 'capybara/rspec'
require 'database_cleaner'
require 'features/web_helpers'

require File.join(File.dirname(__FILE__), '..', 'app/bookmark_manager.rb')

Capybara.app = BookmarkManager

RSpec.configure do |config|
  config.include Capybara::DSL

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
