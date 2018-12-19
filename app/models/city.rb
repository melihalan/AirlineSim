class City < ApplicationRecord
  belongs_to :country
  has_one :hub
  has_many :xroute
end
