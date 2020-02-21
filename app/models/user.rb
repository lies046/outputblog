class User < ApplicationRecord
    def self.find_for_oauth(auth)
    user = User.where(uid: auth.uid, provider: auth.provider).first

    unless user
      user = User.create(
        id: User.all.last.id + 1,
        uid:      auth.uid,
        provider: auth.provider,
        nickname:  auth.info.name,
        image: auth.info.image,
        email:    User.dummy_email(auth),
        password: Devise.friendly_token[0, 20]
      )
    end

    user
  end

  private

  def self.dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end

  mount_uploader :image, ImagesUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:omniauthable,omniauth_providers: [:twitter]
  has_many :likes, dependent: :destroy
         has_many :posts, dependent: :destroy
         has_many :comments,dependent: :destroy
         validates :nickname, presence: true,uniqueness: true
end
