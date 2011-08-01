require 'rubygems'
require 'bundler/setup'

require 'imified'

RSpec.configure do |config|
  config.mock_framework = :rspec

  # Default configuration for tests.
  config.before(:each) do
    Imified.email_address = 'rspec_email_address'
    Imified.password = 'rspec_password'
    Imified.botkey = 'rspec_botkey'
  end
end
