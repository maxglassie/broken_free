class AddColumnsToCountries < ActiveRecord::Migration[5.0]
  def change
    add_column :countries, :income_group, :string
    add_column :countries, :two_code, :string
  end
end
