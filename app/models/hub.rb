class Hub < ApplicationRecord

  belongs_to :city
  belongs_to :user, optional:true
  has_many :xroute
  has_many :staffs

  after_create :calculate, on: :create


  def calculate
    @population = self.city.population
    @slots = self.slots
    self.update(rental_cost: @population/2000*@slots, office_cost: self.staffs.count*2000)
    return self.rental_cost, self.office_cost
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
