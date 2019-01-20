class RemoveReferencesFromLiabilities < ActiveRecord::Migration[5.2]
  def change
    remove_reference :liabilities, :turn_id, foreign_key: true
  end
end
