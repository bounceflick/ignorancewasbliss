require_relative "parser"
require 'pathname'

APP_ROOT = Pathname.new(File.dirname(File.expand_path(__FILE__))).parent
filename =APP_ROOT.join('db', 'data')

CSVParser.set_source(filename + 'businesses.csv')
restaurant_data = CSVParser.parse_to_hashes
p restaurant_data[0]

CSVParser.set_source(filename + 'inspections.csv')
inspection_data = CSVParser.parse_to_hashes
p inspection_data[0]

CSVParser.set_source(filename + 'violations.csv')
violation_data = CSVParser.parse_to_hashes
p violation_data[0]
