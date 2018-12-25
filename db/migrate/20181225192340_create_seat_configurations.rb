class CreateSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    create_table :seat_configurations do |t|
      t.string :name
      t.integer :first_class
      t.integer :business_class
      t.integer :economy_class
      t.integer :passenger

      t.timestamps
    end
  end
end
