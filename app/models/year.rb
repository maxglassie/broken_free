class Year < ApplicationRecord
  has_many :indicators
  has_many :countries, through: :indicators
end