class AddFieldsToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_reference :planes, :user, foreign_key: true
    add_column :planes, :location, :integer
  end
end
