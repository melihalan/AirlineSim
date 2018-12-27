class CreateRevenues < ActiveRecord::Migration[5.2]
  def change
    create_table :revenues do |t|
      t.references :book, foreign_key: true
      t.references :turn, foreign_key: true
      t.string :type
      t.integer :value

      t.timestamps
    end
  end
end
