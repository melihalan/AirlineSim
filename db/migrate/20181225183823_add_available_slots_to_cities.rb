class AddAvailableSlotsToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :available_slots, :integer
  end
end
