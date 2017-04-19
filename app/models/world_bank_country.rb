class WorldBankCountry
  attr_reader :data, :name, :region, :income_level, :capital, :longitude, :latitude

  def self.find_by_country_code(code)
    service = WorldBankService.new
    data = service.country_code(code)
    world_bank_country = WorldBankCountry.new(data)
  end

  def initialize(data)
    @code = data[1][0]["id"]
    @name = data[1][0]["name"]
    @region = data[1][0]["region"]["value"]
    @income_level = data[1][0]["incomeLevel"]["value"]
    @capital = data[1][0]["capitalCity"]
    @longitude = data[1][0]["longitude"]
    @latitude = data[1][0]["latitude"]
  end

  def indicators
    WorldBankIndicator.highest_income_share(@code)
  end

end