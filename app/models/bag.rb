class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many_attached :images

  validates :title, :brand, :price, presence: true


  BRAND = [ "Chanel", "Chloé", "Lanvin", "Givenchy", "Dior", "Louis Vuitton", "Hermès", "Burberry", "Yves Saint Laurent", "Prada", "Fendi" ]
  MOOD = [ "Evening chic", "Business Meeting", "Day in the countryside", "Party", "Casual", "Romantic date" ]
  STYLE = [ "Handbag", "Shoulder bag", "Clutch", "Backpack" ]

end
