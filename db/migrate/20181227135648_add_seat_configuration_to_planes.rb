class AddSeatConfigurationToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_column :planes, :seat_configuration, :integer
  end
end
