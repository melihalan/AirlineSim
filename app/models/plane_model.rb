class PlaneModel < ApplicationRecord
  belongs_to :plane_manufacturers
  has_many :seat_configuration
end
