class Country < ApplicationRecord
  belongs_to :territory
  has_many :city
end
