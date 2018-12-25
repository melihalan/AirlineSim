class AddPlaneModelReferenceToSeatConfigurations < ActiveRecord::Migration[5.2]
  def change
    add_reference :seat_configurations, :plane_model, foreign_key: true
  end
end
