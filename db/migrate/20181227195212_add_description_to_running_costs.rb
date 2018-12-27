class AddDescriptionToRunningCosts < ActiveRecord::Migration[5.2]
  def change
    add_column :running_costs, :description, :string
  end
end
