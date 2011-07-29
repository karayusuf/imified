require "imified/version"

module Imified
  autoload :Message, 'imified/message'

  BOTKEY = YAML.load_file('lib/imified.yml')["Imified"]["botkey"]
end
