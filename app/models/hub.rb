class Hub < ApplicationRecord
  belongs_to :city
  has_many :xroute
end
