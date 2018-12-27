class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :user
  has_many :schedule
  has_many :staff

  after_create :name, :buy, on: :create

  def seat_configuration
    SeatConfiguration.find(self.seat_configuration)
  end

  def name
    @count = PlaneModel.find(self.plane_model_id).counter
    @name = "#{self.plane_model.name} / #{@count}"
    self.update(name: @name)
    return @name
  end

  def buy
    Investment.new(category: "New Planes", value: self.plane_model.cost + self.seat_configuration.cost, description: "#{plane.name}")
  end
end
