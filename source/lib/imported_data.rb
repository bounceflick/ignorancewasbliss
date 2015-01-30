require_relative "parser"
require 'pathname'

root = Pathname.new(File.dirname(File.expand_path(__FILE__))).parent
filename = root.join('db', 'data')

CSVParser.set_source(filename + 'businesses.csv')
@@restaurant_data = CSVParser.parse_to_hashes


CSVParser.set_source(filename + 'inspections.csv')
@@inspection_data = CSVParser.parse_to_hashes


CSVParser.set_source(filename + 'violations.csv')
@@violation_data = CSVParser.parse_to_hashes

