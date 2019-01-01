class CreateAircraftLeasings < ActiveRecord::Migration[5.2]
  def change
    create_table :aircraft_leasings do |t|
      t.string :name
      t.integer :tier
      t.float :discount_factor
      t.integer :lease_time
      t.float :month_rate

      t.timestamps
    end
  end
end
