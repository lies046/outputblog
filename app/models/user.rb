class User < ApplicationRecord
  mount_uploader :image, ImagesUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        
         has_many :likes, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :comments,dependent: :destroy
         validates :nickname, presence: true,uniqueness: true, length: {in:3..6}
end
