require 'net/http'
require 'net/https'
require 'uri'

module Imified
  autoload :Message, 'imified/message'
  autoload :User,    'imified/user'
  autoload :Version, 'imified/version'

  # Identify the Imified configuration.
  CONFIG = YAML.load_file('lib/imified.yml')

  # Reference to the Imified BOTKEY.
  BOTKEY = CONFIG["Imified"]["botkey"]

  # Reference to the Imified Account Username.
  USERNAME = CONFIG["Imified"]["username"]

  # Reference to the Imified Account Password.
  PASSWORD = CONFIG["Imified"]["password"]

  # Imified API URL.
  URL = 'https://www.imified.com/api/bot/'

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
    User.all
  end
end
