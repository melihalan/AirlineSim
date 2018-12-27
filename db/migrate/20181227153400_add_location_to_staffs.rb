class AddLocationToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :location, :integer
  end
end
