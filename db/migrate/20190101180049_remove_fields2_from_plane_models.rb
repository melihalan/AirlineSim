class RemoveFields2FromPlaneModels < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plane_models, :plane_manufacturer_id, foreign_key: true
  end
end
