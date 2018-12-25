class AddFields2ToPlaneModels < ActiveRecord::Migration[5.2]
  def change
    add_column :plane_models, :size, :string
    add_column :plane_models, :code, :string
  end
end
