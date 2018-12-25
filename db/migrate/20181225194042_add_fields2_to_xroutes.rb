class AddFields2ToXroutes < ActiveRecord::Migration[5.2]
  def change
    add_column :xroutes, :origin, :integer
    add_column :xroutes, :destination, :integer
  end
end
