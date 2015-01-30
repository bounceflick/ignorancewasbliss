require_relative "parser"

CSVParser.set_source('businesses.csv')
restaurant_data = CSVParser.parse_to_hashes
p restaurant_data

CSVParser.set_source('inspections.csv')
inspection_data = CSVParser.parse_to_hashes
p inspection_data

CSVParser.set_source('violations.csv')
violation_data = CSVParser.parse_to_hashes
p violation_data
