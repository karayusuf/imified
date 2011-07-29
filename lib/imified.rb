require 'net/http'
require 'uri'

module Imified
  autoload :Message, 'imified/message'
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
  IMIFIED_URL = URI.parse('https://www.imified.com/api/bot/')
end
