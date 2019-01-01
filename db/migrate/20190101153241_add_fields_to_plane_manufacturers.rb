class AddFieldsToPlaneManufacturers < ActiveRecord::Migration[5.2]
  def change
    add_column :plane_manufacturers, :airbus_320, :float
    add_column :plane_manufacturers, :airbus_330, :float
    add_column :plane_manufacturers, :airbus_350, :float
    add_column :plane_manufacturers, :airbus_380, :float
    add_column :plane_manufacturers, :boeing_737, :float
    add_column :plane_manufacturers, :boeing_747, :float
    add_column :plane_manufacturers, :boeing_777, :float
    add_column :plane_manufacturers, :boeing_787, :float
  end
end
