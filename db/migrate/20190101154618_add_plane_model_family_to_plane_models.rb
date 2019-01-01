class AddPlaneModelFamilyToPlaneModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :plane_models, :plane_model_family, foreign_key: true
  end
end
