class CreatePlaneManufacturers < ActiveRecord::Migration[5.2]
  def change
    create_table :plane_manufacturers do |t|
      t.string :name

      t.timestamps
    end
  end
end
