class RemoveFieldFromHubs < ActiveRecord::Migration[5.2]
  def change
    remove_column :hubs, :opening_cost, :integer
  end
end
