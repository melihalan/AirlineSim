class AddFieldsToStaffs < ActiveRecord::Migration[5.2]
  def change
    add_reference :staffs, :user, foreign_key: true
    add_column :staffs, :runtime, :integer
  end
end
