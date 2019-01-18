class AddBookValueToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_column :planes, :book_value, :integer
  end
end
