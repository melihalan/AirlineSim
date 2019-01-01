class PlaneModel < ApplicationRecord
  belongs_to :plane_manufacturers, optional: true
  has_many :seat_configuration

  def counter
    @counter += 100
    self.update(counter: @counter)
    return @counter
  end
  
end
