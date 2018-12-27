class RemoveReferencesFromPlanes < ActiveRecord::Migration[5.2]
  def change
    remove_reference :planes, :xroute, foreign_key: true
  end
end
