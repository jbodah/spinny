require 'webrick'
require 'cgi'

Thread.abort_on_exception = true

module Spinny
  # Responsible for forking off new code runs
  class Server
    DEFAULT_PORT = 8080

    def self.connect(port = DEFAULT_PORT)
      Connection.new(port)
    end

    def initialize(filepath)
      @filepath = filepath
    end

    def start!
      require @filepath
      queue = Queue.new
      start_http_listener(queue)
      loop do
        fork_code = queue.deq
        pid = fork { eval fork_code }
        Process.wait pid
      end
    end

    def start_http_listener(queue)
      Thread.new do
        server = WEBrick::HTTPServer.new(:Port => DEFAULT_PORT)
        server.mount_proc '/enqueue' do |req, res|
          code = CGI.parse(req.body)['code'].first
          queue.enq(code)
        end
        server.start
      end
    end
  end

end
