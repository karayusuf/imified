require "imified/version"

module Imified
  BOTKEY = YAML.load_file('lib/imified.yml')["Imified"]["botkey"]
end
