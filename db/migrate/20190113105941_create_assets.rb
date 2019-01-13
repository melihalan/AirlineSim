class CreateAssets < ActiveRecord::Migration[5.2]
  def change
    create_table :assets do |t|
      t.references :book, foreign_key: true
      t.references :turn, foreign_key: true
      t.string :category
      t.integer :value
      t.string :description

      t.timestamps
    end
  end
end
