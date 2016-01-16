require 'net/http'
require 'uri'

module Spinny
  class Connection
    def initialize(port = Server::DEFAULT_PORT)
      @port = port
    end

    def push(code)
      # connect to port, send code over port
      uri = URI("http://localhost:#{@port}/enqueue")
      Net::HTTP.post_form(uri, "code" => code)
    end
  end
end
