require_relative 'csv_reader'
require_relative 'area'

class Setup

  attr_accessor :areas

  def initialize
    csv = CSVReader.new("./zipcode-db.csv")

    @areas = []
    csv.read do |a|
      @areas << Area.new(a)
    end

    self
      
  end

end
