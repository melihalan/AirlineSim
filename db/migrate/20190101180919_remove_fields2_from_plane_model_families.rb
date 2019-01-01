class RemoveFields2FromPlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plane_model_families, :bank, foreign_key: true
  end
end
