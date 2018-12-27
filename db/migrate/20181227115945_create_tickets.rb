class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.references :flight, foreign_key: true
      t.integer :base_cost
      t.integer :price
      t.string :category

      t.timestamps
    end
  end
end
