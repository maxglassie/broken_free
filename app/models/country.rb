class Country < ApplicationRecord
  belongs_to :region
  has_many :indicators
  has_many :years, through: :indicators
end