class AddFieldsToLiabilities < ActiveRecord::Migration[5.2]
  def change
    add_column :liabilities, :term, :datetime
  end
end
