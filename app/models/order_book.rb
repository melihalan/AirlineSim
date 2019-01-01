class OrderBook < ApplicationRecord
  belongs_to :aircraft_leasing
  belongs_to :user
  belongs_to :plane_model_family
  belongs_to :plane_model
end
