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

  def example_get_all_users_response
    response = %Q{
      <rsp stat="ok">
        <users count="1">
          <user>
            <status>Online</status>
            <extendedstatus>Working on an IMified bot</extendedstatus>
            <userkey>123456789</userkey>
            <screenname>me@jkarayusuf.com</screenname>
            <user>user_screenname</user>
            <network>AIM</network>
            <created>2007-09-26 13:30:25</created>
            <lastonline>2007-09-28 15:20:15</lastonline>
            <lastcall>2007-09-28 15:20:15</lastcall>
          </user>
        </users>
      </rsp>
    }

    Nokogiri::XML(response)
  end
end
