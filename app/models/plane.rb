class Plane < ApplicationRecord
  belongs_to :plane_model
  belongs_to :xroute
  has_one :schedule
end
