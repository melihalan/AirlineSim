class RunningCost < ApplicationRecord
  belongs_to :book, optional:true
  belongs_to :turn, optional:true
end
