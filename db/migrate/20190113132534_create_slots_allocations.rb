class CreateSlotsAllocations < ActiveRecord::Migration[5.2]
  def change
    create_table :slots_allocations do |t|
      t.references :city, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :slots
      t.integer :used_slots

      t.timestamps
    end
  end
end
