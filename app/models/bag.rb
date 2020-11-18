class Bag < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :title, :brand, :price, presence: true


  BRAND = [ "Chanel", "Chloé", "Lanvin", "Givenchy", "Dior", "Louis Vuitton", "Hermès", "Burberry", "Yves Saint Laurent", "Prada" ]
  MOOD = [ "Evening chic", "Business Meeting", "Day in the countryside", "Party", "Casual", "Romantic date" ]
  STYLE = [ "Handbag", "Shoulder bag", "Clutch", "Backpack" ]

end
