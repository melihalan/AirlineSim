class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :investments, :type, :category
    rename_column :running_costs, :type, :category
    rename_column :revenues, :type, :category
    rename_column :asset_sales, :type, :category
  end
end
