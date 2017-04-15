require 'rails_helper'

feature "user can search for country by code" do
  scenario "user enters country code and it returns world bank data" do
    visit root_path

    fill_in("Search", with: "arg")
    click_on "Search"

    expect(current_path).to eq(root_path)

    expect(page).to have_content("Argentina")
    expect(page).to have_content("Latin America & Caribbean ")
    expect(page).to have_content("Upper middle income")
    expect(page).to have_content("Buenos Aires")
    expect(page).to have_content("-58.4173")
    expect(page).to have_content("-34.6118")
  end
end