require 'rails_helper'

RSpec.feature "user visits region index page" do

  scenario "user sees countries listed by region" do
    visit root_path

    expect(current_path).to eq(root_path)

    save_and_open_page
    expect(page).to have_content("Asia-Pacific")
    expect(page).to have_content("Afghanistan")
  end
end