class AddFieldsToFlights < ActiveRecord::Migration[5.2]
  def change
    add_column :flights, :arrival, :datetime
  end
end
