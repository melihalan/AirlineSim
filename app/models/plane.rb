class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :user
  belongs_to :seat_configuration
  has_many :schedule
  has_many :staff
  validates :user_id, presence: true
  validates :plane_model_id, presence: true
  validates :seat_configuration_id, presence: true

  after_create :postcreate, on: :create

  def postcreate
    #@count = PlaneModel.find(self.plane_model_id).counter
    #@name = "#{self.plane_model.name} / #{@count}"
    #self.update(name: @name)
    #Investment.new(category: "New Planes", value: self.plane_model.cost + self.seat_configuration.cost, description: "#{plane.name}")
  end

  def postupdate
  end

  def postdestroy
  end

end
