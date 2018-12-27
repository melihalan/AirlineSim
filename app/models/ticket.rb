class Ticket < ApplicationRecord
  belongs_to :flight

  def calculate
    @base_cost = self.flight.base_cost / self.seat_configuration.passenger * 0,8
    self.flight.ppp_cost
    self.update(base_cost: @base_cost, ppp_first: @ppp_first, ppp_business: @ppp_business, ppp_economy: @ppp_economy)
  end

end
