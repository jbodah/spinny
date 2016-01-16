module Spinny
  # An simple REPL that will allow you to push code to
  # run on a Spinny::Server
  class InteractiveClient
    def self.start!
      new.start!
    end

    def initialize
      @connection = Server.connect
    end

    def start!
      loop do
        puts "Type code to eval in fork then hit enter..."
        code = gets
        @connection.push(code)
      end
    end
  end
end
