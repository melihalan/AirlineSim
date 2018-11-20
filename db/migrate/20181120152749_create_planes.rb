class CreatePlanes < ActiveRecord::Migration[5.2]
  def change
    create_table :planes do |t|
      t.references :plane_model, foreign_key: true
      t.references :xroute, foreign_key: true

      t.timestamps
    end
  end
end
