class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :brand, :price, :availability, presence: true
end
