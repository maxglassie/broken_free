class CountryObject
  attr_reader :name, :region, :income_level, :capital, :longitude, :latitude


  def self.find_by_country_code(code)
    service = WorldBankService.new
    data = service.country_code(code)
    CountryObject.new(data)
  end

  def initialize(data)
    @name = data[1].first["name"]
    @region = data[1].first["region"]["value"]
    @income_level = data[1].first["incomeLevel"]["value"]
    @capital = data[1].first["capitalCity"]
    @longitude = data[1].first["longitude"]
    @latitude = data[1].first["latitude"]
  end

end