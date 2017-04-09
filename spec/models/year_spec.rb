require 'rails_helper'

RSpec.describe Year, type: :model do
  context "relationships" do
    it {should have_many(:indicators)}
    it {should have_many(:countries)}
  end
end