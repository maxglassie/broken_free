require 'rails_helper'

describe "world bank country plain old ruby object" do
  it ".find_by_country_code returns country information from WorldBank API" do
    code = "arg"
    argentina = CountryObject.find_by_country_code(code)

    expect(argentina.name).to eq("Argentina")
    expect(argentina.region).to eq("Latin America & Caribbean ")
    expect(argentina.income_level).to eq("Upper middle income")
    expect(argentina.capital).to eq("Buenos Aires")
    expect(argentina.longitude).to eq("-58.4173")
    expect(argentina.latitude).to eq("-34.6118")
  end

  it ".indicators returns an array of indicator objects" do
    code = "arg"
    argentina = WorldBankCountry.find_by_country_code(code)

    indicators = argentina.indicators
    binding.pry
    expect(indicators[0].highest_income).to eq("N/A")
    expect(indicators[0].year).to eq("2016")
    expect(indicators[3].highest_income).to eq("30.56")
    expect(indicators[3].year).to eq("2013")
  end
end