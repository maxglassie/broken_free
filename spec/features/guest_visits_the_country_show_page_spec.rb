require 'rails_helper'

RSpec.feature "user visits home page" do

  before(:each) do
    @south_asia = Region.create(id: 1, title: "South Asia")
    @europe = Region.create(id: 2, title: "Europe & Central Asia") 
    @middle_east = Region.create(id: 3, title: "Middle East & North Africa")

    @year_2016 = Year.create(year: "2016")
    @year_2015 = Year.create(year: "2015")
    @year_2014 = Year.create(year: "2013")
    @year_2013 = Year.create(year: "2014")

    @pakistan = Country.create(id: 149, name: "Pakistan", code: "PAK", created_at: "2017-04-15 22:38:59", updated_at: "2017-04-15 22:38:59", region_id: 1, income_group: "Lower middle income", two_code: "PK")
    @belgium = Country.create(id: 19, name: "Belgium", code: "BEL", created_at: "2017-04-15 22:38:58", updated_at: "2017-04-15 22:38:58", region_id: 2, income_group: "High income", two_code: "BE")
    @egypt = Country.create(id: 59, name: "Egypt, Arab Rep.", code: "EGY", created_at: "2017-04-15 22:38:58", updated_at: "2017-04-15 22:38:58", region_id: 3, income_group: "Lower middle income", two_code: "EG")

    @pakistan_indicator_2016 = @pakistan.indicators.create(economic_freedom_index: 55.9, corruption_perception_index: 32.0, year: @year_2016)
    @pakistan_indicator_2015 = @pakistan.indicators.create(economic_freedom_index: 55.6, corruption_perception_index: 30.0, year: @year_2015)
    @pakistan_indicator_2014 = @pakistan.indicators.create(economic_freedom_index: 55.2, corruption_perception_index: 29.0, year: @year_2014)
    @pakistan_indicator_2013 = @pakistan.indicators.create(economic_freedom_index: 55.1, corruption_perception_index: 28.0, year: @year_2013)

    @pakistan_world_bank_country = WorldBankCountry.find_by_country_code(@pakistan.code)
    @pakistan_decorator = CountryDecorator.new(@pakistan, @pakistan_world_bank_country)
  end

  scenario "guest visits country show page and sees EFI & CPI indicators" do
    visit countries_path(@pakistan)

    expect(page).to have_content("Pakistan")
    expect(page).to have_content("South Asia")

    expect(page).to have_content("Economic Freedom Index")
    expect(page).to have_content("Corruption Perception Index")
    expect(page).to have_content("Income Share Held By Top 10%")

    expect(page).to have_content(55.9)
    expect(page).to have_content(55.6)
    expect(page).to have_content(55.2)
    expect(page).to have_content(55.1)

    expect(page).to have_content(32.0)
    expect(page).to have_content(30.0)
    expect(page).to have_content(29.0)
    expect(page).to have_content(28.0)

    expect(page).to have_content("N/A")
    expect(page).to have_content("N/A")
    expect(page).to have_content("30.75")
    expect(page).to have_content("30.56")
  end
end