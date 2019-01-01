class CreateBanks < ActiveRecord::Migration[5.2]
  def change
    create_table :banks do |t|
      t.string :name
      t.integer :tier
      t.float :interest_rate_loan
      t.integer :max_limit_loan
      t.integer :payback_time
      t.float :interest_rate_loc
      t.integer :max_limit_loc

      t.timestamps
    end
  end
end
