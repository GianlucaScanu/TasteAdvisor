class Reviewer < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable

    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true, on: :create
    validates :password_confirmation, presence: true, on: :create
    
    has_many :review
    has_one :omniuser #https://stackoverflow.com/questions/11286560/devise-with-omniauth-for-multiple-models-without-sti

    has_one_attached :profile_picture, service: :google
    validates :profile_picture,  blob: { content_type: :image }

    def self.from_google(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |reviewer|
        #campi da assegnare al modello reviewer, tramite oauth
        reviewer.uid = auth.uid
        reviewer.provider = auth.provider
        reviewer.email = auth.info.email
        reviewer.password = Devise.friendly_token[0, 20]
        #creo un username, tecnicamente univoco, in maniera incrementale per disponibilità
        i = -1
        s_username = auth.info.first_name.to_s << "-" << auth.info.last_name.to_s
        t_username = s_username
        while (Reviewer.exists?(username: t_username))
          i += 1
          t_username = s_username + i.to_s
        end
        reviewer.username = t_username
        reviewer.profile_picture.attach(io: URI.parse(auth.info.image).open, filename: "profile_picture.jpg")
        reviewer.description = "Ciao mi chiamo " << auth.info.name << " e sono registrato tramite account Google! "
      end
    end
    
end

#per eliminare l'utente e ritestarlo (ID = numero dell'id utente, es.8) scriverlo su qualsiasi pagina (es.index.html.erb)
#<%#=Reviewer.find(ID).destroy%> 
#l'id si può vedere tramite /reviewers/

#FONTI E GUIDE SEGUITE:
#https://github.com/aki77/activestorage-validator
#https://www.youtube.com/watch?v=CnZnwV38cjo
#https://github.com/Deanout/omniauth_google/blob/main/app/models/user.rb
#CAMPI auth https://github.com/zquestz/omniauth-google-oauth2
#https://stackoverflow.com/questions/51027995/how-to-save-an-image-from-a-url-with-rails-active-storage
