class Spot < ApplicationRecord

  belongs_to :user
  validates :address, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :about, presence: true, length: { maximum: 255 }
end
