require 'rails_helper'

RSpec.describe WorldBank do
  it "loads country and region names" do
    world_bank = WorldBank.new
    world_bank.import_WB_countries_regions

    countries = Country.all
    afghanistan = countries.first
    zimbabwe = countries.last

    expect(afghanistan.name).to eq("Afghanistan")
    expect(afghanistan.region).to eq("South Asia")
    expect(afghanistan.code).to eq("AFG")

    expect(zimbabwe.name).to eq("Zimbabwe")
    expect(zimbabwe.region).to eq("Sub-Saharan Africa")
    expect(zimbabwe.code).to eq("ZWE")
  end
end