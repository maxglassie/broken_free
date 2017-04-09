require 'rails_helper'

RSpec.describe Country, type: :model do
  context "relationships" do
    it {should belong_to(:region)}
    it {should have_many(:indicators)}
    it {should have_many(:years)}
  end
end