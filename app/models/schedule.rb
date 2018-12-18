class Schedule < ApplicationRecord
  belongs_to :plane
  belongs_to :xroute, optional: true

  after_create :assign, on: :create

  def assign
    @plane_model_id = Plane.find(self.plane_id).plane_model
    @xroute_id = Plane.find(self.plane_id).xroute_id
    @duration = Xroute.find(@xroute_id).distance / @plane_model_id.avg_speed * 60
    @ta1 = self.td1 + @duration

    self.update(xroute_id: @xroute_id, duration: @duration, ta1: @ta1 )
    return self.xroute_id, self.duration, self.ta1
    end
  end
