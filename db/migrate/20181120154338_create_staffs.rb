class CreateStaffs < ActiveRecord::Migration[5.2]
  def change
    create_table :staffs do |t|
      t.references :hub, foreign_key: true
      t.references :plane, foreign_key: true
      t.string :job
      t.integer :salary

      t.timestamps
    end
  end
end
