class CreateFlights < ActiveRecord::Migration[5.2]
  def change
    create_table :flights do |t|
      t.references :xroute, foreign_key: true
      t.references :schedule, foreign_key: true
      t.datetime :departure
      t.integer :duration
      t.integer :air_tax
      t.integer :fuel_cost
      t.string :flight_number

      t.timestamps
    end
  end
end
