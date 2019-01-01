class SeatConfiguration < ApplicationRecord
  belongs_to :plane_models, optional: true

  def passenger
    @passenger = self.economy_class + self.business_class + self.first_class
    self.update(passenger: @passenger)
    return @passenger
  end
end
