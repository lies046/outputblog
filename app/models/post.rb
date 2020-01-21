class Post < ApplicationRecord

  validates :title, :content, presence: true
  belongs_to :user
  has_many :likes, dependent: :destroy
  mount_uploader :image, ImageUploader

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end

end
