class Spot < ApplicationRecord

  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :address, presence: true, length: { maximum: 40 }
  validates :name, presence: true, length: { maximum: 50 }
  validates :about, presence: true, length: { maximum: 255 }

  
  private
    
end
