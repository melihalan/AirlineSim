class CreateRunningCosts < ActiveRecord::Migration[5.2]
  def change
    create_table :running_costs do |t|
      t.references :book, foreign_key: true
      t.references :turn, foreign_key: true
      t.string :type
      t.integer :value

      t.timestamps
    end
  end
end
