class AddFieldsToPlaneModels < ActiveRecord::Migration[5.2]
  def change
    add_column :plane_models, :counter, :integer
  end
end
