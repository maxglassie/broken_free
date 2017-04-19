require 'rails_helper'

RSpec.feature "user visits home page" do

  before(:each) do
    @south_asia = Region.create(id: 1, title: "South Asia")
    @europe = Region.create(id: 2, title: "Europe & Central Asia") 
    @middle_east = Region.create(id: 3, title: "Middle East & North Africa")

    @pakistan = Country.create(id: 149, name: "Pakistan", code: "PAK", created_at: "2017-04-15 22:38:59", updated_at: "2017-04-15 22:38:59", region_id: 1, income_group: "Lower middle income", two_code: "PK")
    @belgium = Country.create(id: 19, name: "Belgium", code: "BEL", created_at: "2017-04-15 22:38:58", updated_at: "2017-04-15 22:38:58", region_id: 2, income_group: "High income", two_code: "BE")
    @egypt = Country.create(id: 59, name: "Egypt, Arab Rep.", code: "EGY", created_at: "2017-04-15 22:38:58", updated_at: "2017-04-15 22:38:58", region_id: 3, income_group: "Lower middle income", two_code: "EG")
  end

  scenario "user sees regions and their countries" do
    visit root_path

    expect(current_path).to eq('/')

    expect(page).to have_content("South Asia")
    expect(page).to have_content("Europe & Central Asia")
    expect(page).to have_content("Middle East & North Africa")

    expect(page).to have_content("Pakistan")
    expect(page).to have_content("Belgium")
    expect(page).to have_content("Egypt")
  end

  scenario "they can sort countries by region" do
    visit root_path

    expect(page).to have_content("South Asia")
    expect(page).to have_content("Europe & Central Asia")
    expect(page).to have_content("Middle East & North Africa")

    click_on("South Asia")

    expect(page).to have_content("Pakistan")
    expect(page).to_not have_content("Belgium")
    expect(page).to_not have_content("Egypt")
  end

  scenario "guest clicks on a country and goes to their show page" do
    visit root_path

    click_on "Belgium"

    expect(current_path).to eq(countries_path(@belgium))
  end
end