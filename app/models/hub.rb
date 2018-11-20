class Hub < ApplicationRecord
  belongs_to :city
  has_many :xroute
  has_many :staffs
end
