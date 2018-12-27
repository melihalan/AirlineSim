class CreateAmenities < ActiveRecord::Migration[5.2]
  def change
    create_table :amenities do |t|
      t.references :flight, foreign_key: true
      t.string :category
      t.string :sub_category
      t.integer :ppp

      t.timestamps
    end
  end
end
