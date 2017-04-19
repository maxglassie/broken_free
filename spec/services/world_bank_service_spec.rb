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

  it "returns the income share held by highest 10% for 2016 - 2014 for a country" do
    country_code = "egy"
    income_share = @service.highest_income_share(country_code)

    expect(income_share[1][0]["indicator"]["value"]).to eq("Income share held by highest 10%")
    expect(income_share[1][0]["country"]["value"]).to eq("Egypt, Arab Rep.")
    expect(income_share[1][0]["value"]).to eq(nil)
    expect(income_share[1][0]["date"]).to eq("2016")
  end

  it "returns the fuel exports % of total merchandise exports" do
    country_code = "ecu"
    fuel_exports = @service.fuel_exports(country_code)

    expect(fuel_exports[1][0]["indicator"]["value"]).to eq("Fuel exports (% of merchandise exports)")
    expect(fuel_exports[1][0]["country"]["value"]).to eq("Ecuador")
    expect(fuel_exports[1][0]["value"]).to eq(nil)
    expect(fuel_exports[1][0]["date"]).to eq("2016")
  end

  it "returns the fuel exports % of total merchandise exports" do
    country_code = "IND"
    central_government_debt = @service.central_government_debt(country_code)

    expect(central_government_debt[1][0]["indicator"]["value"]).to eq("Central government debt, total (% of GDP)")
    expect(central_government_debt[1][0]["country"]["value"]).to eq("India")
    expect(central_government_debt[1][0]["value"]).to eq(nil)
    expect(central_government_debt[1][0]["date"]).to eq("2016")
  end
end