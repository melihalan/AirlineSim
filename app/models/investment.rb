class Investment < ApplicationRecord
  belongs_to :book
  belongs_to :turn

  after_create :deduct_balance, on: :create

  def deduct_balance
    self.book.money -= self.value
  end
end
