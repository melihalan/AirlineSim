class RemoveFields2FromXroutes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :xroutes, :hub, foreign_key: true
    remove_reference :xroutes, :city, foreign_key: true
    remove_column :xroutes, :operating_cost, :integer
  end
end
