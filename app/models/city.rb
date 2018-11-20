class City < ApplicationRecord
  has_one :hub
  has_many :xroute
end
