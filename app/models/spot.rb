class Spot < ApplicationRecord
  validates :address, presence: true, length: { maximum: 40 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :about, presence: true, length: { maximum: 255 }
  belongs_to :user
  has_many :favorites, foreign_key: 'spot_id', dependent: :destroy
  has_many :users, through: :favorites
  mount_uploader :picture, PictureUploader
end
