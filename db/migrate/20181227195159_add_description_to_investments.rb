class AddDescriptionToInvestments < ActiveRecord::Migration[5.2]
  def change
    add_column :investments, :description, :string
  end
end
