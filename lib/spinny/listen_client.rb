require 'listen'
require 'spinny/load_client'

module Spinny
  class ListenClient
    def self.start!
      new(ARGV).start!
    end

    def initialize(dirs)
      @listener = Listen.to(*dirs, only: /\.rb$/) do |modified, added, removed|
        changed = modified + added
        Spinny::LoadClient.new(changed).start!
      end
    end

    def start!
      @listener.start
      sleep
    end
  end
end
