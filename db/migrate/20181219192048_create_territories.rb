class CreateTerritories < ActiveRecord::Migration[5.2]
  def change
    create_table :territories do |t|
      t.string :name

      t.timestamps
    end
  end
end
