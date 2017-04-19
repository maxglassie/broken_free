require 'rails_helper'

RSpec.describe "world bank indicator" do
  it "self.highest_income_share returns an array of indicator objects" do
    code = "arg"
    indicators = WorldBankIndicator.highest_income_share(code)

    indicator = indicators.first
    expect(indicator.highest_income).to eq(nil)
    expect(indicator.year).to eq("2016")
  end

  it ".add_highest_income adds data to self" do
    code = "arg"
    service = WorldBankService.new
    highest_income_share = service.highest_income_share(code)
    indicator_data = highest_income_share[1][0]

    indicator = WorldBankIndicator.new.add_highest_income(indicator_data)

    expect(indicator.highest_income).to eq(nil)
    expect(indicator.year).to eq("2016")
  end
end