class SlotsAllocation < ApplicationRecord
  belongs_to :city, optional:true
  belongs_to :user, optional:true
end
