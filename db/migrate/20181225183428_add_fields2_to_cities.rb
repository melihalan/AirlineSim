class AddFields2ToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :hub_opening_cost, :integer
    add_column :cities, :accomadation_cost, :integer
  end
end
