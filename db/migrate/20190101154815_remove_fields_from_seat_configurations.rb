class RemoveFieldsFromSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    remove_column :seat_configurations, :cost, :integer
    remove_column :seat_configurations, :name, :string
  end
end
