class RemoveFieldsFromSchedules < ActiveRecord::Migration[5.2]
  def change
    remove_reference :schedules, :xroute, foreign_key: true
    remove_column :schedules, :duration, :integer
    remove_column :schedules, :td1, :integer
    remove_column :schedules, :ta1, :integer
  end
end
