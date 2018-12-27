class AddDescriptionToAssetSales < ActiveRecord::Migration[5.2]
  def change
    add_column :asset_sales, :description, :string
  end
end
