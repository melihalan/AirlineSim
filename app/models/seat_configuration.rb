class SeatConfiguration < ApplicationRecord
  belongs_to :plane_models
  
  def calculate
    @passenger = self.economy_class + self.business_class + self.first_class
    self.update(passenger: @passenger)
    return self.passenger
  end
end
