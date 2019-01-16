class AddFields2ToPlanes < ActiveRecord::Migration[5.2]
  def change
    add_reference :planes, :seat_configuration, foreign_key: true
  end
end
