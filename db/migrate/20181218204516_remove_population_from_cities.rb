class RemovePopulationFromCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :population, :integer
  end
end
