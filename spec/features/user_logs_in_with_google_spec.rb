require 'rails_helper'


RSpec.feature "user logs in" do
  #thanks to Jesse Spevack for guidance on testing Google OAuth
  scenario "using google oauth2" do
    stub_omniauth
    visit root_path
    expect(page).to have_link("Sign in with Google")
    click_link "Sign in with Google"
    
    expect(page).to have_content("Max Glassie")
    expect(page).to have_content("Logout")
  end

   def stub_omniauth
      OmniAuth.config.test_mode = true
      binding.pry
      OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new({
            provider: "google_oauth2",
            uid: "12345678910",
            info: {
              name: "Max Glassie",
              email: "msglassie@gmail.com",
            },
            credentials: {
              token: "012345678910",
              expires_at: DateTime.now
            }
          })
    end
end


