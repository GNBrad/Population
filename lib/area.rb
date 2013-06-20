class Area

  attr_accessor :zipcode, :estimated_population, :city, :state

  def initialize(hash)
    @zipcode = hash[:zipcode].to_i || 0
    @estimated_population = hash[:estimated_population].to_i || 0
    @city = hash[:city] || "N/A"
    @state = hash[:state] || "N/A"
  end

  def to_s
    "#{@city}, #{@state}, #{@zipcode} has an #{estimated_population} people!"
  end