class User < ApplicationRecord
  mount_uploader :image, ImagesUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :posts
end
