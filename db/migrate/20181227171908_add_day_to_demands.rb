class AddDayToDemands < ActiveRecord::Migration[5.2]
  def change
    add_column :demands, :day, :string
  end
end
