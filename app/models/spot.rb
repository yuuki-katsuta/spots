class Spot < ApplicationRecord

  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :address, presence: true, length: { maximum: 50 }
  validates :name, presence: true, length: { maximum: 40 }
  validates :about, presence: true, length: { maximum: 255 }
  validate  :picture_size
  
  private
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
