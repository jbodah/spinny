module Spinny
  # A simple client that just loads files
  # Can be used to run Minitest tests
  class LoadClient
    def initialize(filepaths)
      @code = filepaths.map {|fp| "load '#{fp}'"}.join(';')
      @connection = Server.connect
    end

    def start!
      @connection.push(@code)
    end
  end
end
