class ChangeFieldsOnPlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_column :plane_model_families, :production_time, :float
    add_column :plane_model_families, :production_capacity, :float
  end
end
