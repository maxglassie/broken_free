class CreateIndicators < ActiveRecord::Migration[5.0]
  def change
    create_table :indicators do |t|
      t.float :EFI
      t.float :CPI
      t.references :country, foreign_key: true
      t.references :year, foreign_key: true

      t.timestamps null: false
    end
  end
end
