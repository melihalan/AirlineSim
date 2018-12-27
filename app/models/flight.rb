class Flight < ApplicationRecord
  belongs_to :xroute
  belongs_to :schedule
  has_many :ticket
  has_many :amenity

  after_create :calculate, on: :create

  def plane
    Plane.find(self.schedule.plane_id)
  end

  def plane_model
    PlaneModel.find(self.plane.plane_model_id)
  end

  def avg_speed
    self.plane_model.avg_speed
  end

  def duration
    self.xroute.distance / self.avg_speed * 60 + 20
  end

  def boarding_cost
    City.find(self.xroute.origin).boarding_cost
  end

  def air_tax
    self.xroute.distance * 0,35
  end

  def fuel_cost
    0,47 * self.duration * self.plane_model.fuel_use
  end

  def landing_cost
    City.find(self.xroute.destination).landing_cost
  end

  def flight_number
    "#{self.plane_id}.#{self.xroute_id}.#{self.id}"
  end

  def arrival
    self.departure + @duration.minutes
  end

  def seat_configuration
    SeatConfiguration.find(self.plane.seat_configuration)
  end


  def calculate
    self.update(duration: self.duration, air_tax: self.air_tax, fuel_cost: self.fuel_cost, flight_number: self.flight_number, arrival: self.arrival)
  end

  def staff_runtime(s)
    Staff.where("job = ? AND plane_id = ?", s, self.plane_id) do |q|
      if q.runtime > 480
        q.runtime -= self.duration
        q.plane_id = nil
        @available = Staff.where("job = ? AND plane_id = ?", s, nil)
        @available.first.plane_id = self.plane_id
        @available.first.runtime += self.duration
        unless User.hubs.include? q.location
          @accomadation_cost = City.find(self.xroute.origin).accomadation_cost
          @description = "#{q.name} had stayed overnight in #{City.find(self.xroute.origin).name} on #{self.departure} due to overtime working."
          RunningCost.new(category: "Staff Accomodation Charges", value: @accomadation_cost, description: @description)
        end
      else
        q.runtime += self.duration
        q.location = City.find(self.xroute.destination).id
      end
    end
  end

  def base_cost
    self.fuel_cost + self.air_tax + self.landing_cost
  end

  def ppp_cost
    @a_f = 0
    self.amenities.where("sub_category = ?", "first").each do |a|
      @a_f += a.ppp
    end
    @a_b = 0
    self.amenities.where("sub_category = ?", "business").each do |a|
      @a_b += a.ppp
    end
    @a_e = 0
    self.flight.amenities.where("sub_category = ?", "economy").each do |a|
      @a_e += a.ppp
    end
    @ppp_economy = self.boarding_cost + @a_e
    @ppp_business = self.boarding_cost + @a_b
    @ppp_first = self.boarding_cost + @a_f
    return @ppp_first, @ppp_business, @ppp_economy
  end

  def demand
    @day = self.departure.strftime("%A")
    @time = self.departure.strftime("%H").to_i
    if @time < 9
      @demand = Demand.find_by(day: @day).em
    elsif @time < 12
      @demand = Demand.find_by(day: @day).lm
    elsif @time < 15
      @demand = Demand.find_by(day: @day).nn
    elsif @time < 18
      @demand = Demand.find_by(day: @day).an
    elsif @time < 21
      @demand = Demand.find_by(day: @day).eg
    else @time < 24
      @demand = Demand.find_by(day: @day).le
    end
    @ecd = @demand / 350 * self.xroute.ecd
    @bcd = @demand / 350 * self.xroute.bcd
    @fcd = @demand / 350 * self.xroute.fcd
    return @ecd, @bcd, @fcd
  end

  def sell_tickets
    self.demand
    self.seat_configuration.economy_class.times do
      @ect_sold = 0
      if @ecd > 0
        @ect_sold += 1
        self.xroute.ecd -= 1
      end
    end
    self.seat_configuration.business_class.times do
      @bct_sold = 0
      if @bcd > 0
        @bct_sold += 1
        self.xroute.bcd -= 1
      end
    end
    self.seat_configuration.first_class.times do
      @fct_sold = 0
      if @fcd > 0
        @fct_sold += 1
        self.xroute.fcd -= 1
      end
    end
    return @ect_sold, @bct_sold, @fct_sold
  end


  def fly
    if self.plane.location == City.find(self.xroute.origin).id
      self.sell_tickets
      @e_revenue = @etc_sold * Ticket.find_by(flight_id: self.id, category: "economy").price
      @b_revenue = @btc_sold * Ticket.find_by(flight_id: self.id, category: "business").price
      @f_revenue = @ftc_sold * Ticket.find_by(flight_id: self.id, category: "first").price
      @revenue = @e_revenue + @b_revenue + @f_revenue
      Revenue.new(category: "Ticket Sales", value: @revenue, description: "FN #{self.flight_number} / E:#{@etc_sold} / B:#{@btc_sold} / F:#{@ftc_sold}")
      self.staff_runtime("pilot")
      self.staff_runtime("host")
      RunningCost.new(category: "Base Flight Costs", value: self.base_cost, description: "FN #{self.flight_number} / Overspace Fees:#{self.air_tax} / Fuel Cost:#{self.fuel_cost} / Landing Cost:#{self.landing_cost}")
      self.ppp_cost
      @e_cost = @etc_sold * @ppp_economy
      @b_cost = @btc_sold * @ppp_business
      @f_cost = @ftc_sold * @ppp_first
      @passenger_costs = @e_cost + @b_cost + @f_cost
      RunningCost.new(category: "Costs per Passenger", value: @passenger_costs, description: "FN #{self.flight_number} / E:#{@etc_sold}*#{@ppp_economy} / B:#{@btc_sold}*#{@ppp_business} / F:#{@ftc_sold}*#{@ppp_first}")
      self.plane.location = City.find(self.xroute.destination).id
    end
  end

end
