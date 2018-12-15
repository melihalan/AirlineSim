class Hub < ApplicationRecord

  belongs_to :city
  has_many :xroute
  has_many :staffs

  after_create :calculate, on: :create


  def calculate
    @population = self.city.population
    self.update(opening_cost: @population/10, rental_cost: @population/100, office_cost: self.staffs.count*2000)
    return self.opening_cost, self.rental_cost, self.office_cost
  end

  def name
    self.city.name
  end

  def latitude
    self.city.latitude
  end

  def longtitude
    self.city.longtitude
  end

  def population
    self.city.population
  end

end
