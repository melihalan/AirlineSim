class AddFieldToPlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    add_reference :plane_model_families, :plane_manufacturer, foreign_key: true
  end
end
