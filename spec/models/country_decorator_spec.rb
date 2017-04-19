require 'rails_helper'

RSpec.describe "country_decorator" do
  before(:each) do
    @south_asia = Region.create(id: 1, title: "South Asia")

    @year_2016 = Year.create(year: "2016")
    @year_2015 = Year.create(year: "2015")
    @year_2014 = Year.create(year: "2013")
    @year_2013 = Year.create(year: "2014")

    @pakistan = Country.create(id: 149, name: "Pakistan",
                                                  code: "PAK", region_id: 1,
                                                  income_group: "Lower middle income",
                                                  two_code: "PK")

    @pakistan_indicator_2016 = @pakistan.indicators
                                                                    .create(economic_freedom_index: 55.9,
                                                                    corruption_perception_index: 32.0, 
                                                                    year: @year_2016)
    @pakistan_indicator_2015 = @pakistan.indicators
                                                                    .create(economic_freedom_index: 55.6, 
                                                                      corruption_perception_index: 30.0, 
                                                                      year: @year_2015)
    @pakistan_indicator_2014 = @pakistan.indicators.create(economic_freedom_index: 55.2, 
      corruption_perception_index: 29.0, year: @year_2014)
    @pakistan_indicator_2013 = @pakistan.indicators.create(economic_freedom_index: 55.1, 
      corruption_perception_index: 28.0, year: @year_2013)
  end

  it "takes an AR object and a WBcountry object as arguments" do
    pakistan_world_bank_country = WorldBankCountry.find_by_country_code(@pakistan.code)
    pakistan_decorator = CountryDecorator.new(@pakistan, @pakistan_world_bank_country)

    expect(pakistan_decorator.class).to eq(CountryDecorator)
  end

  it ".find_by_country_code returns a decorator object" do
    code = "PAK"
    pakistan_decorator = CountryDecorator.find_by_country_code(code)

    expect(pakistan_decorator.class).to eq(CountryDecorator)
  end

  it "decorator can access methods for both objects" do
    code = "PAK"
    pakistan_decorator = CountryDecorator.find_by_country_code(code)

    binding.pry
    expect(pakistan_decorator.country.name).to eq("Pakistan")
    expect(pakistan_decorator.world_bank_country.name).to eq("Pakistan")
  end

end