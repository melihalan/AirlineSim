class AddSlotsToHubs < ActiveRecord::Migration[5.2]
  def change
    add_column :hubs, :slots, :integer
  end
end
