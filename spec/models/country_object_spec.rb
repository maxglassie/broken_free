require 'rails_helper'

describe "country plain old ruby object" do
  it ".find_by_country_code returns World Bank country object" do
    code = "arg"
    argentina = WorldBankCountry.find_by_country_code(code)

    expect(argentina.name).to eq("Argentina")
    expect(argentina.region).to eq("Latin America & Caribbean ")
    expect(argentina.income_level).to eq("Upper middle income")
    expect(argentina.capital).to eq("Buenos Aires")
    expect(argentina.longitude).to eq("-58.4173")
    expect(argentina.latitude).to eq("-34.6118")
  end

  it ".find_by_country_code returns World Bank country object" do
    code = "arg"
    argentina = WorldBankCountry.find_by_country_code(code)

    expect(argentina.name).to eq("Argentina")
    expect(argentina.region).to eq("Latin America & Caribbean ")
    expect(argentina.income_level).to eq("Upper middle income")
    expect(argentina.capital).to eq("Buenos Aires")
    expect(argentina.longitude).to eq("-58.4173")
    expect(argentina.latitude).to eq("-34.6118")
  end

end