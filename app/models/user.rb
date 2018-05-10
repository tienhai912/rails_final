class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: %i(facebook google_oauth2).freeze

  has_many :orders, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :blogs, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true,
    length: {maximum: Settings.users.name_max_length}
  validates :email, presence: true,
    length: {maximum: Settings.users.email_max_length},
    format: {with: VALID_EMAIL_REGEX}

  class << self
    def from_omniauth auth
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        auth_info = auth.info
        user.email = auth_info.email
        user.password = Devise.friendly_token[0, 20]
        user.name = auth_info.name
      end
    end
  end
end
