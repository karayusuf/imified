class Imified::User

  # Find all of the users of a bot as well as a user count.
  # @return[XML]
  def self.all
    url = URI.parse(Imified::URL)
    req = Net::HTTP::Post.new(url.path)
    req.basic_auth Imified::USERNAME, Imified::PASSWORD
    req.set_form_data({
      'apimethod' => 'getallusers',
      'botkey' => Imified::BOTKEY
    })

    http = Net::HTTP.new(url.host, url.port)
    http.use_ssl = true

    response = http.start {|http| http.request(req) }

    case response
    when Net::HTTPSuccess, Net::HTTPRedirection
      response.body
    else
      response.error!
    end
  end
end
