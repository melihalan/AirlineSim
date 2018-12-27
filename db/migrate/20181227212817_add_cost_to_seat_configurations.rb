class AddCostToSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    add_column :seat_configurations, :cost, :integer
  end
end
