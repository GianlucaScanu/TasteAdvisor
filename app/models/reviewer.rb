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

    def self.from_google(email:, uid:)
      #return nil unless email =~ /@mybusiness.com\z/
      #create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
        user.email = email
        user.password = Devise.friendly_token[0, 20]
        user.full_name = "lassi_test"
      end
    end

    def self.from_google2(auth)
      #https://www.youtube.com/watch?v=CnZnwV38cjo
      #https://github.com/Deanout/omniauth_google/blob/main/app/models/user.rb
      #return nil unless email =~ /@mybusiness.com\z/
      #create_with(uid: uid, full_name: full_name, avatar_url: avatar_url).find_or_create_by!(email: email)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |reviewer|
      reviewer.email = auth.info.email
      #username = email
      reviewer.username = auth.info.email
      reviewer.password = Devise.friendly_token[0, 20]
      #reviewer.full_name = auth.info.name # assuming the user model has a name
      #user.avatar_url = auth.info.image # assuming the user model has an image
      end
    end
  

    #https://github.com/aki77/activestorage-validator
end
