class RemoveFieldsFromPlaneModels < ActiveRecord::Migration[5.2]
  def change
    remove_reference :plane_models, :plane_manufacturer, foreign_key: true
  end
end
