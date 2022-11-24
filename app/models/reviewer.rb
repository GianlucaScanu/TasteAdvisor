class Reviewer < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable,
           :omniauthable, omniauth_providers: [:google_oauth2]

    validates :username, presence: true
    validates :username, uniqueness: true
    
    has_many :review

    has_one_attached :profile_picture, service: :google
    validates :profile_picture,  blob: { content_type: :image }
    

    def self.create_from_provider_data(provider_data)
        where(provider: provider_data.provider, uid: provider_data.uid).first_or_create  do |user|
          user.email = provider_data.info.email
          user.password = Devise.friendly_token[0, 20]
        end
    end

    def self.from_google_params
        @from_google_params ||= {
          uid: auth.uid,
          email: auth.info.email
        }
     end
  
     def auth
        @auth ||= request.env['omniauth.auth']
     end
    #https://github.com/aki77/activestorage-validator
end
