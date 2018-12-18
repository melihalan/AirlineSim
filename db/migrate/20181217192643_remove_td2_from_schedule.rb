class RemoveTd2FromSchedule < ActiveRecord::Migration[5.2]
  def change
    remove_column :schedules, :td2, :integer
  end
end
