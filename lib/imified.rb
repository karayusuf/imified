require 'active_support'
require 'net/http'
require 'net/https'
require 'uri'

module Imified
  autoload :Message, 'imified/message'
  autoload :Request, 'imified/request'
  autoload :User,    'imified/user'
  autoload :Version, 'imified/version'

  # Imified API url
  URL = 'https://www.imified.com/api/bot/'

  # User's unique botkey
  mattr_accessor :botkey

  # User's Imified account name
  mattr_accessor :email_address

  # User's Imified account password
  mattr_accessor :password

  # Default way to setup Imified.
  # To be used during initialization.
  #
  # == Example:
  #
  #   Imified.setup do |config|
  #     config.botkey = 'the bot you would like to use'
  #     config.email_address = 'your imified email address'
  #     config.password = 'your imified password'
  #   end
  #
  def self.setup
    yield self
  end

  # Fetch a list of all of the bots known users.
  # Includes a total count of the users.
  #
  # == Example
  #
  #   Imified.get_all_users
  #
  # == Return
  #
  #   Successful Response:
  #     <rsp stat="ok">
  #       <users count="2">
  #         <user>
  #           <status>Online</status>
  #           <extendedstatus>Working on an IMified bot</extendedstatus>
  #           <userkey>123456789</userkey>
  #           <screenname>user_screenname</screenname> *deprecated
  #           <user>user_screenname</user>
  #           <network>AIM</network>
  #           <created>2007-09-26 13:30:25</created>
  #           <lastonline>2007-09-28 15:20:15</lastonline>
  #           <lastcall>2007-09-28 15:20:15</lastcall>
  #         </user>
  #         <user>
  #           <status>Offline</status>
  #           <extendedstatus></extendedstatus>
  #           <userkey>123456789</userkey>
  #           <screenname>user_screenname</screenname> *deprecated
  #           <user>user_screenname</user>
  #           <network>Jabber</network>
  #           <created>2007-09-26 13:30:25</created>
  #           <lastonline>2007-09-28 15:20:15</lastonline>
  #           <lastcall>2007-09-28 15:20:15</lastcall>
  #         </user>
  #       </users>
  #     </rsp>
  #
  #   Failed Response:
  #     <rsp stat="fail">
  #       <err msg="error message text"/>
  #     </rsp>
  #
  def Imified.get_all_users
    request = Imified::Request.new
    response = request.submit
  end
end
