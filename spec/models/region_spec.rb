require 'rails_helper'

RSpec.describe Region, type: :model do
  context "relationships" do
    it {should have_many(:countries)}
  end
end