class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :introduce, length: { maximum: 255 }
  has_many :spots
  has_many :favorites
  has_many :subspots, through: :favorites, source: :spot
  mount_uploader :image, ImageUploader
  
  def favorite(spot)
    favorites.find_or_create_by(spot_id: spot.id)
  end
  
  def unfavorite(spot)
   favorite = favorites.find_by(spot_id: spot.id)
   favorite.destroy if favorite
  end
  
  def favorite?(spot)
  spot.favorites.where(user_id: id).any?
  end
end
