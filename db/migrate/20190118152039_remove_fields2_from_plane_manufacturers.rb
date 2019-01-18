class RemoveFields2FromPlaneManufacturers < ActiveRecord::Migration[5.2]
  def change
    remove_column :plane_manufacturers, :airbus_320, :float
    remove_column :plane_manufacturers, :airbus_330, :float
    remove_column :plane_manufacturers, :airbus_350, :float
    remove_column :plane_manufacturers, :airbus_380, :float
    remove_column :plane_manufacturers, :boeing_737, :float
    remove_column :plane_manufacturers, :boeing_747, :float
    remove_column :plane_manufacturers, :boeing_777, :float
    remove_column :plane_manufacturers, :boeing_787, :float
  end
end
