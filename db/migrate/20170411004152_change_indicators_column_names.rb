class ChangeIndicatorsColumnNames < ActiveRecord::Migration[5.0]
  def change
    rename_column :indicators, :EFI, :economic_freedom_index
    rename_column :indicators, :CPI, :corruption_perception_index
  end
end
