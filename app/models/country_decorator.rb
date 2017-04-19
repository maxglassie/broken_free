class CountryDecorator

  def self.find_by_country_code(code)
    country = Country.find_by(code: code.upcase)
    world_bank_country = WorldBankCountry.find_by_country_code(code)
    CountryDecorator.new(country, world_bank_country)
  end

  attr_reader :country, :world_bank_country

  def initialize(country, world_bank_country)
    @country = country
    @world_bank_country = world_bank_country
  end

  def indicators
    country_indicators = @country.indicators
    world_bank_country_indicators = @world_bank_country.indicators
    wb_index = 0
    indicators = []

    country_indicators.each do |country_indicator|
      indicators << [country_indicator, world_bank_country_indicators[wb_index]]
      wb_index += 1
    end
    indicators
  end

end