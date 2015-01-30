#!/usr/bin/env ruby

require 'rubygems'
require 'commander/import'

program :version, '0.0.1'
program :description, 'Ignorance Was Bliss - What you never wanted to know about where you eat...'
 
command :list do |c|
  c.syntax = 'IgnoranceIsBliss list [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '-n', '--name NAME', Integer, 'Specify a number of records'
  c.action do |args, options|
    # Do something or c.when_called Ignoranceisbliss::Commands::List
    puts "args #{args} options #{options.n}"
  end
end

