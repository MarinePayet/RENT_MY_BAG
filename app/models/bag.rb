class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :title, :brand, :price, :availability, presence: true

  BRAND = [ "Chanel", "Chloé", "Lanvin", "Givenchy", "Dior", "Louis Vuitton", "Hermès", "Burberry", "Yves Saint Laurent", "Prada" ]
end
