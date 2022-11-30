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
    
    def self.from_google(auth)
      #https://www.youtube.com/watch?v=CnZnwV38cjo
      #https://github.com/Deanout/omniauth_google/blob/main/app/models/user.rb
      #CAMPI auth https://github.com/zquestz/omniauth-google-oauth2
      where(provider: auth.provider, uid: auth.uid).first_or_create do |reviewer|
        #campi da assegnare al modello reviewer, tramite oauth
        #testati
        reviewer.email = auth.info.email
        reviewer.password = Devise.friendly_token[0, 20]
        reviewer.username = auth.info.first_name.to_s
        reviewer.username +="-"+ auth.info.last_name.to_s
        reviewer.username +="-"
        reviewer.username += auth.info.email.to_s
        reviewer.uid = auth.uid
        reviewer.provider = auth.provider

        #non funziona
        #va caricato su GCS, secondo me non rileva il link corretto e da errore
        #reviewer.profile_picture = auth.info.image

        #reviewer.full_name = auth.info.name # assuming the user model has a name
        #user.avatar_url = auth.info.image # assuming the user model has an image
      end
    end
  

    #https://github.com/aki77/activestorage-validator
end
