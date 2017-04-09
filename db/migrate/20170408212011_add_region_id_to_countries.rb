class AddRegionIdToCountries < ActiveRecord::Migration[5.0]
  def change
    add_reference :countries, :region, foreign_key: true
  end
end
