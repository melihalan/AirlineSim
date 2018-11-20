class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.float :latitude
      t.float :longtitude
      t.integer :population

      t.timestamps
    end
  end
end
