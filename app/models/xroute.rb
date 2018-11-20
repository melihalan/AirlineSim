class Xroute < ApplicationRecord
  belongs_to :hub
  belongs_to :city
  has_many :planes
  has_many :schedules
end
