class Hub < ApplicationRecord

  belongs_to :city
  belongs_to :user
  has_many :xroute
  has_many :staffs
  validates :user_id, presence: true
  validates :city_id, presence: true
  validates :slots, presence: true

  after_create :postcreate, on: :create

  def postcreate
    #defines population of the hub
    #population = self.city.population
    #defines slots of the hub
    #@slots = self.slots
    #defines booked slots in one city
    @booked_slots = 0
    #@slots = self.slots
    #updates rental_cost & office_cost & slots of the hub
    #self.update(rental_cost: @population/2000*@slots, office_cost: self.staffs.count*2000)
    #creates a new investment
    Investment.create(book_id: self.user.book.id, turn_id: Turn.last.id, category: "New Hub Creation", value: self.city.hub_opening_cost, description: "Created a hub in #{self.city.name}")
    # Deduct hub_opening_cost from book.balance
    self.user.book.update(balance: self.user.book.balance - self.city.hub_opening_cost)
    #creates new running costs for rental_cost & office_cost
    RunningCost.create(book_id: self.user.book.id, turn_id: Turn.last.id, category: "Hub Rental Cost", value: self.rental_cost, description: "#{self.city.name}" )
    RunningCost.create(book_id: self.user.book.id, turn_id: Turn.last.id, category: "Hub Office Cost", value: self.office_cost, description: "#{self.city.name}" )
    #allocates slots to user & recalculates the @booked_slots in that city
    SlotsAllocation.create(user_id: self.user.id, city_id: self.city.id, slots: self.slots, used_slots: 0)
    self.city.slots_allocations.each { |s| @booked_slots += s.slots}
    #updates available_slots in the city
    self.city.update(available_slots: self.city.slots - @booked_slots)
  end

  def postupdate
    #@population = self.city.population
    #@slots = self.slots
    #defines booked slots in one city
    @booked_slots = 0
    #self.update(rental_cost: @population/2000*@slots, office_cost: self.staffs.count*2000)
    #updates running costs for rental_cost & office_cost
    #updates available_slots in the city
    RunningCost.find_by(category: "Hub Rental Cost", description: "#{self.city.name}").update(value: self.rental_cost)
    RunningCost.find_by(category: "Hub Office Cost", description: "#{self.city.name}").update(value: self.office_cost)
    #updates slot allocation to user
    SlotsAllocation.find_by(city_id: self.city, user_id: self.user).update(slots: self.slots)
    self.city.slots_allocations.each { |s| @booked_slots += s.slots}
    self.city.update(available_slots: self.city.slots - @booked_slots)
  end

  def postdestroy
    @booked_slots = 0
    RunningCost.find_by(category: "Hub Rental Cost", description: "#{self.city.name}").destroy
    RunningCost.find_by(category: "Hub Office Cost", description: "#{self.city.name}").destroy
    SlotsAllocation.find_by(city_id: self.city, user_id: self.user).destroy
    self.city.slots_allocations.each { |s| @booked_slots += s.slots}
    self.city.update(available_slots: self.city.slots - @booked_slots)
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
