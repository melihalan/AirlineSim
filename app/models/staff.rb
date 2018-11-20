class Staff < ApplicationRecord
  belongs_to :hub, optional: true
  belongs_to :plane, optional: true
end
