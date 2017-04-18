require 'rails_helper'

RSpec.describe User, type: :model do
  it "creates or updates itself from an oauth hash" do
      # auth = {
      #   provider: "google_oauth2",
      #   uid: "12345678910",
      #   info: {
      #     name: "Max Glassie"
      #   },
      #   credentials: {
      #     oauth_token: "abcdefg12345",
      #     refresh_token: "12345abcdefg",
      #     expires_at: DateTime.now
      #   }
      # }
      auth = stub_omniauth

      User.from_omniauth(auth)
      new_user = User.first

      expect(new_user.provider).to eq("google_oauth2")
      expect(new_user.uid).to eq("12345678910")
      expect(new_user.name).to eq("Max Glassie")
      expect(new_user.oauth_token).to eq("abcdefg12345")
  end

  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
          provider: "google_oauth2",
          uid: "12345678910",
          info: {
            name: "Max Glassie",
            email: "msglassie@gmail.com",
          },
          credentials: {
            token: "abcdefg12345",
            expires_at: DateTime.now
          }
        })
  end
end