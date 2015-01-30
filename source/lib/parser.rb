
require 'csv'


module CSVParser
  extend self
  def set_source(file)
    @file =  file
  end

  def parse_to_hashes
    data_array = []
    CSV.read(@file, headers:true, header_converters: :symbol, converters: :all).collect do |row|
      data_array << Hash[row.collect { |col,row| [col,row] }]
    end
    return data_array
  end
end
