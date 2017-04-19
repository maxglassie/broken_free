class WorldBankCountry
  attr_reader :data, :name, :region, :income_level, :capital, :longitude, :latitude


  def self.find_by_country_code(code)
    service = WorldBankService.new
    data = service.country_code(code)
    world_bank_country = WorldBankCountry.new(data)
    world_bank_country.create_country
  end

  def initialize(data)
    @data = data
  end

  def create_country
    #add country code - is it in the hash?
    @name = @data[1].first["name"]
    @region = @data[1].first["region"]["value"]
    @income_level = @data[1].first["incomeLevel"]["value"]
    @capital = @data[1].first["capitalCity"]
    @longitude = @data[1].first["longitude"]
    @latitude = @data[1].first["latitude"]
    self
  end

  def create_indicators
    #creates an array of indicator objects for the given country
    #indicator object has highest_income, govt_expenditure, etc
  end

  #indicator.highest_income
  #indicator.years

end