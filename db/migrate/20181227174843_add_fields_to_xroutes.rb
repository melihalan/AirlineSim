class AddFieldsToXroutes < ActiveRecord::Migration[5.2]
  def change
    add_column :xroutes, :ecd, :integer
    add_column :xroutes, :bcd, :integer
    add_column :xroutes, :fcd, :integer
  end
end
