class CreateCreditBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :credit_books do |t|
      t.references :bank, foreign_key: true
      t.references :user, foreign_key: true
      t.string :product
      t.integer :balance
      t.integer :payback_term
      t.integer :interest
      t.datetime :turn

      t.timestamps
    end
  end
end
