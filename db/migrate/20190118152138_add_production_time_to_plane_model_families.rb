class AddProductionTimeToPlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    add_column :plane_model_families, :production_time, :float
  end
end
