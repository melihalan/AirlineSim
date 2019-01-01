class AddField3ToPlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    add_reference :plane_model_families, :bank, foreign_key: true
  end
end
