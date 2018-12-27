class AssetSale < ApplicationRecord
  belongs_to :book
  belongs_to :turn
end
