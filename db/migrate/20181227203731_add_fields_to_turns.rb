class AddFieldsToTurns < ActiveRecord::Migration[5.2]
  def change
    add_column :turns, :term, :datetime
  end
end
