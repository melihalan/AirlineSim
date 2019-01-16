class RemoveFieldsFromPlanes < ActiveRecord::Migration[5.2]
  def change
    remove_column :planes, :seat_configuration, :integer
  end
end
