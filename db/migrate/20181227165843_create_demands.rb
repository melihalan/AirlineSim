class CreateDemands < ActiveRecord::Migration[5.2]
  def change
    create_table :demands do |t|
      t.integer :em
      t.integer :lm
      t.integer :nn
      t.integer :an
      t.integer :eg
      t.integer :le

      t.timestamps
    end
  end
end
