class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :hub
  has_many :plane
  has_many :staff
  has_one :book

  after_create :post_create, on: :create

  def post_create
    Book.create(user_id: self.id, balance: 10000000)
  end
end
