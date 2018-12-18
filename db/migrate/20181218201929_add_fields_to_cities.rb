class AddFieldsToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :country, :string
    add_column :cities, :territory, :string
    add_column :cities, :slots, :integer
    add_column :cities, :ground_operations, :integer
    add_column :cities, :landing_cost, :integer
    add_column :cities, :boarding_cost, :integer
    add_column :cities, :space_rent, :integer
  end
end
