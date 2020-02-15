class Post < ApplicationRecord
  mount_uploader :image, ImagesUploader
  validates :title, presence: true, length: { maximum: 30 } 
  validates :content, presence: true 
  belongs_to :user, optional: true
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
