class AddReferencesToHubs < ActiveRecord::Migration[5.2]
  def change
    add_reference :hubs, :user, foreign_key: true
  end
end
