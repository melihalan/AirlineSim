class AddFieldsToTickets < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :ppp_first, :integer
    add_column :tickets, :ppp_business, :integer
    add_column :tickets, :ppp_economy, :integer
  end
end
