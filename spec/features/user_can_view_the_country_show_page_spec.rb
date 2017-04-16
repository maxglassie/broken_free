require 'rails_helper'

feature "user can search for country by code" do
  scenario "user enters country code and it returns world bank data" do
    country = Country.create(name: "Argentina")

    visit country_path(country)

    expect(page).to have_content("Argentina")
    expect(page).to have_content("Latin America & Caribbean ")
    expect(page).to have_content("Upper middle income")
    expect(page).to have_content("Buenos Aires")
    expect(page).to have_content("-58.4173")
    expect(page).to have_content("-34.6118")
  end
end