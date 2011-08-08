# request.rb
#
# Net::HTTP::Post wrapper
#
# All API calls for requesting user details and sending messages
# should be sent via HTTP POST to the following URL:
# https://www.imified.com/api/bot/.
#
# Authentication is managed using Basic HTTP authentication.
# Every request must include the Authorization HTTP header
# with your IMified username and password.
#
class Imified::Request < Net::HTTP::Post
  URL = URI.parse(Imified::URL)

  # Construct a Net::HTTP::Post object.
  # Prepare basic authentication using the username and
  # password specified in the configuration.
  #
  # == Usage
  #   Imified::Request.new
  #
  # @return[Net::HTTP::Post]
  def initialize(api_method = 'getallusers')
    Imified.validate_configuration!
    super(URL.path)

    self.basic_auth Imified.email_address, Imified.password
    self.add_field 'apimethod', api_method
    self.add_field 'botkey', Imified.botkey
  end

  # Submit the request to Imified.
  def submit
    http = Net::HTTP.new(URL.host, URL.port)
    http.use_ssl = true
    http.start { |send| send.request(self) }
  end
end
