class CountryDelegator < SimpleDelegator
  attr_reader :country

  def self.find_by_country_code
    service = WorldBankService.new
    country = CountryDelegator.new(service.country_code(@country.code))
  end

  def initialize(country)
    super(country)
    @country = country
  end

end