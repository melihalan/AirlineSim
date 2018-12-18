class RemoveTa2FromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :ta2, :integer
  end
end
