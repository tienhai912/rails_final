class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: %i(facebook google_oauth2).freeze

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true

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
