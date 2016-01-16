require 'spinny/version'
require 'spinny/server'
require 'spinny/connection'
require 'spinny/interactive_client'
require 'spinny/load_client'
require 'spinny/listen_client'

# A lighter, less opinionated Ruby pre-loader
module Spinny
  # Block the current thread and boot up a server
  def self.serve!(filepath, load_paths = [])
    puts "Starting Spinny::Server..."
    load_paths.each { |p| $: << p }
    Server.new(filepath).start!
  end
end
