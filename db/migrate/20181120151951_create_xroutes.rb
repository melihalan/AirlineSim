class CreateXroutes < ActiveRecord::Migration[5.2]
  def change
    create_table :xroutes do |t|
      t.references :hub, foreign_key: true
      t.references :city, foreign_key: true
      t.integer :distance
      t.integer :max_num_pas
      t.integer :operating_cost

      t.timestamps
    end
  end
end
