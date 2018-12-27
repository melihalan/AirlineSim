class RemoveFieldsFromTurns < ActiveRecord::Migration[5.2]
  def change
    remove_column :turns, :month, :integer
    remove_column :turns, :year, :integer
  end
end
