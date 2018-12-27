class Revenue < ApplicationRecord
  belongs_to :book
  belongs_to :turn
end
