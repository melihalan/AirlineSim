class Schedule < ApplicationRecord
  belongs_to :plane
  has_many :flight
end
