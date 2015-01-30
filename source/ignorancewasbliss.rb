#!/usr/bin/env ruby

require_relative 'config/application'
# require_relative 'app/controllers/Controller.rb'

# puts "Put your application code in #{File.expand_path(__FILE__)}"


# con = Controller.new(ARGV)
# con.start


Controller.run!(ARGV, View)

