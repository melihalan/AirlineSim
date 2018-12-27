class Book < ApplicationRecord
  belongs_to :user
  has_many :investment
  has_many :running_cost
  has_many :revenue
  has_many :asset_sale
end
