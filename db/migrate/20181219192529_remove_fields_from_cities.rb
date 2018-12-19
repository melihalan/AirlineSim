class RemoveFieldsFromCities < ActiveRecord::Migration[5.2]
  def change
    remove_column :cities, :country, :string
    remove_column :cities, :territory, :string
  end
end
