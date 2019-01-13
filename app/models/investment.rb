class Investment < ApplicationRecord
  belongs_to :book, optional:true
  belongs_to :turn, optional:true

  #after_create :deduct_balance, on: :create

  def deduct_balance
    self.book.balance -= self.value
  end
end
