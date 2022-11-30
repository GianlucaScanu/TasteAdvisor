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

    def auth
      @auth ||= request.env['omniauth.auth']
    end

  #indianetto
  #  def self.from_google(from_google_params)
  #      @from_google_params ||= {
  #        uid: auth.uid,
  #        email: auth.info.email
  #      }
  #  end

  def self.from_google(email:, full_name:, uid:, avatar_url:)
    return nil unless email =~ /@mybusiness.com\z/
    create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
  end
  

    #https://github.com/aki77/activestorage-validator
end
