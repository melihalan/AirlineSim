class City < ApplicationRecord
  belongs_to :country
  has_many :hubs

  def calculate
    @population = self.population
    @pop_slots = @population*self.slots/self.available_slots
    @landing_cost = @pop_slots/30000
    @ground_operations = @landing_cost/2
    @space_rent = @landing_cost / 24
    if self.slots.between?(1,50)
      @boarding_cost = 10
    elsif self.slots.between?(51,300)
      @boarding_cost = 15
    else
      @boarding_cost = 20
    end
    self.update(landing_cost: @landing_cost, ground_operations: @ground_operations, space_rent: @space_rent, boarding_cost: @boarding_cost)
    return self.landing_cost, self.ground_operations, self.space_rent, self.boarding_cost
  end

  def territory
    @country_id = self.country_id
    @territory_id = Country.find(@country_id).territory_id
    @territory = Territory.find(@territory_id).name
    return @territory
  end

  def country
    @country_id = self.country_id
    @country = Country.find(@country_id).name
    return @country
  end
end
