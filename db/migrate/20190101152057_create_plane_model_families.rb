class CreatePlaneModelFamilies < ActiveRecord::Migration[5.2]
  def change
    create_table :plane_model_families do |t|
      t.string :name

      t.timestamps
    end
  end
end
