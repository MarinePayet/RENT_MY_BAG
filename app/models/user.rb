class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :bags
  has_many :bookings
#   validates :first_name, presence: true
#   validates :last_name, presence: true
#   validates :address, presence: true
end
