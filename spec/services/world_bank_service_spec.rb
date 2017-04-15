require 'rails_helper'

describe WorldBankService do
  before(:each) do
    @service = WorldBankService.new
  end

  it "country code returns the world bank country information" do
    country_code = "arg"
    country = @service.country_code(country_code)

    expect(country[1].first["name"]).to eq("Argentina")
    expect(country[1].first["region"]["value"]).to eq("Latin America & Caribbean ")
    expect(country[1].first["incomeLevel"]["value"]).to eq("Upper middle income")
    expect(country[1].first["capitalCity"]).to eq("Buenos Aires")
    expect(country[1].first["longitude"]).to eq("-58.4173")
    expect(country[1].first["latitude"]).to eq("-34.6118")
  end
end