class Staff < ApplicationRecord
  belongs_to :hub, optional: true
  belongs_to :plane, optional: true
  belongs_to :user, optional: true

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
