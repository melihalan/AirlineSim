class CreateHubs < ActiveRecord::Migration[5.2]
  def change
    create_table :hubs do |t|
      t.references :city, foreign_key: true
      t.integer :opening_cost
      t.integer :rental_cost
      t.integer :office_cost

      t.timestamps
    end
  end
end
