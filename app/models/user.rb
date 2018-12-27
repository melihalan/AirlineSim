class User < ApplicationRecord
  has_many :hub
  has_many :plane
  has_many :staff
  has_one :book
end
