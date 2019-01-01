class AddFields3ToPlaneModels < ActiveRecord::Migration[5.2]
  def change
    add_reference :plane_models, :plane_manufacturer, foreign_key: true
  end
end
