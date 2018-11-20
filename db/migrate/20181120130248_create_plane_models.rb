class CreatePlaneModels < ActiveRecord::Migration[5.2]
  def change
    create_table :plane_models do |t|
      t.string :name
      t.integer :range
      t.integer :avg_speed
      t.integer :max_pas
      t.integer :fuel_use
      t.integer :cost
      t.integer :maintanence
      t.integer :pilots
      t.integer :hosts

      t.timestamps
    end
  end
end
