require_relative '../lib/parser'
require_relative '../config/application'


module RestaurantImporter
  def self.import
    root = Pathname.new(File.dirname(File.expand_path(__FILE__))).parent
    filename = root.join('db', 'data')
    CSVParser.set_source(filename + 'test_businesses.csv')
    restaurant_data = CSVParser.parse_to_hashes
    restaurant_data.each do |args|
      Restaurant.create(args)
    end
  end
end


module InspectionImporter
  def self.import
    root = Pathname.new(File.dirname(File.expand_path(__FILE__))).parent
    filename = root.join('db', 'data')
    CSVParser.set_source(filename + 'test_inspections.csv')
    inspection_data = CSVParser.parse_to_hashes
    inspection_data.each do |args|
      Inspection.create(args)
    end
  end
end


module ViolationImporter
  def self.import
    root = Pathname.new(File.dirname(File.expand_path(__FILE__))).parent
    filename = root.join('db', 'data')
    CSVParser.set_source(filename + 'test_violations.csv')
    violation_data = CSVParser.parse_to_hashes
    violation_data.each do |args|
      Violation.create(args)
    end
  end
end

module Importer
  def self.import
    RestaurantImporter.import
    InspectionImporter.import
    ViolationImporter.import
  end
end
