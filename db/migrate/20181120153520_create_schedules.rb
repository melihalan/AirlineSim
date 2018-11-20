class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.references :plane, foreign_key: true
      t.references :xroute, foreign_key: true
      t.integer :duration
      t.integer :td1
      t.integer :ta1
      t.integer :td2
      t.integer :ta2

      t.timestamps
    end
  end
end
