class CreateStaffNames < ActiveRecord::Migration[5.2]
  def change
    create_table :staff_names do |t|
      t.string :name
      t.string :surname

      t.timestamps
    end
  end
end
