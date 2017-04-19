class CountryDecorator < SimpleDelegator
  attr_reader :country, :world_bank_country

  def self.find_by_country_code(code)
    country = Country.find_by(code: code.upcase)
    world_bank_country = WorldBankCountry.find_by_country_code(code)
    CountryDecorator.new(country, world_bank_country)
  end

  attr_reader :country, :world_bank_country

  def initialize(country, world_bank_country)
    super(country)
    @country = country
    @world_bank_country = world_bank_country
  end

end