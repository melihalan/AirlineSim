class AddFields2ToStaffs < ActiveRecord::Migration[5.2]
  def change
    change_column_default :staffs, :runtime, to: 0
  end
end
