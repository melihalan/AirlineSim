class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :xroute
  has_one :schedule
  has_many :staffs

  def name
    return self.plane_model.name
  end

  def staff_list
    @staff_list = []
    self.staffs.each do |staff|
      @staff_list.push(staff.name, staff.job)
    end
    return @staff_list
  end
end
