class RemoveCodeFromPlaneModels < ActiveRecord::Migration[5.2]
  def change
    remove_column :plane_models, :code, :string
  end
end
