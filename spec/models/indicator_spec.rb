require 'rails_helper'

RSpec.describe Indicator, type: :model do
  context "relationships" do
    it {should belong_to(:year)}
    it {should belong_to(:country)}
  end
end