class AddNameToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_column :staffs, :name, :string
  end
end
