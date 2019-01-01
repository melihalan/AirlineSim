class RemoveGroundOperationsFromCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :ground_operations, :integer
  end
end
