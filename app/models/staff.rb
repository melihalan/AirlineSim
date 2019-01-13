class Staff < ApplicationRecord
  belongs_to :hub, optional: true
  belongs_to :plane, optional: true
  belongs_to :user, optional: true

  def self.hire_officer(hub_id)
    @name = "#{StaffName.find(StaffName.pluck(:id).sample).name} #{StaffName.find(StaffName.pluck(:id).sample).surname}"
    @hub_id = hub_id
    Staff.new(name: @name, job: 'officer', hub_id: @hub_id, salary: 4000)
  end

  def self.hire_pilots(plane_id)
    @name = "#{StaffName.find(StaffName.pluck(:id).sample).name} #{StaffName.find(StaffName.pluck(:id).sample).surname}"
    @plane_id = plane_id
    Staff.new(name: @name, job: 'pilot', plane_id: @plane_id, salary: 12000)
  end

  def self.hire_attendant(plane_id)
    @name = "#{StaffName.find(StaffName.pluck(:id).sample).name} #{StaffName.find(StaffName.pluck(:id).sample).surname}"
    @plane_id = plane_id
    Staff.new(name: @name, job: 'attendant', plane_id: @plane_id, salary: 6000)
  end

  def hub_name
    if self.hub == nil
      return nil
    else
      return self.hub.name
    end
  end

  def plane_name
    if self.plane == nil
      return nil
    else
      return self.plane.name
    end
  end
end
