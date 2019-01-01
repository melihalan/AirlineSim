class CreateOrderBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :order_books do |t|
      t.references :aircraft_leasing, foreign_key: true
      t.references :user, foreign_key: true
      t.references :plane_model_family, foreign_key: true
      t.references :plane_model, foreign_key: true
      t.integer :que_number
      t.datetime :delivery_date

      t.timestamps
    end
  end
end
