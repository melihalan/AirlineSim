class AddPopulationToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :population, :integer
  end
end
