class Turn < ApplicationRecord
@@i = 2019/1

  after_create :counter, on: :create

  def counter
    self.term = @@i
    @@i.month += 1
  end

end
