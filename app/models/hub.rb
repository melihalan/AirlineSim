class Hub < ApplicationRecord

  belongs_to :city
  belongs_to :user
  has_many :xroute
  has_many :staffs
  validates :user_id, presence: true
  validates :city_id, presence: true
  validates :slots, presence: true

  #after_create :calculate, on: :create
  
  def postcreate
    #defines population of the hub
    @population = self.city.population
    #defines slots of the hub
    @slots = self.slots
    #updates rental_cost & office_cost & slots of the hub
    self.update(rental_cost: @population/2000*@slots, office_cost: self.staffs.count*2000)
    #creates a new investment
    Investment.new(book_id: self.user.book, turn_id: Turn.current_term_id, category: "New Hub Creation", value: self.hub_opening_cost, description: "Created a hub in #{self.city.name}")
    #deduct hub_opening_cost from user.balance
    User.find(self.user_id).deduct_balance(self.hub_opening_cost)
    #creates new running costs for rental_cost & office_cost
    RunningCost.new(book_id: self.user.book, category: "Hub Rental Cost", value: self.rental_cost, description: "#{self.city.name}" )
    RunningCost.new(book_id: self.user.book, category: "Hub Office Cost", value: self.office_cost, description: "#{self.city.name}" )
    #allocates slots to user
    SlotsAllocation.new(city_id: self.city, user_id: self.user, slots: self.slots)
    #updates available_slots in the city
    City.find(self.city).slot_update
  end

  def postupdate
    @population = self.city.population
    @slots = self.slots
    self.update(rental_cost: @population/2000*@slots, office_cost: self.staffs.count*2000)
    #updates running costs for rental_cost & office_cost
    RunningCost.find_by(category: "Hub Rental Cost", description: "#{self.city.name}").update(value: self.rental_cost)
    RunningCost.find_by(category: "Hub Office Cost", description: "#{self.city.name}").update(value: self.office_cost)
    #updates slot allocation to user
    SlotsAllocation.find_by(city_id: self.city, user_id: self.user).update(slots: self.slots)
    #updates available_slots in the city
    City.find(self.city).slot_update
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
