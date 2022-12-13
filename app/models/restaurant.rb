class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, :username, presence: true
    validates :username,  uniqueness: true

    has_one_attached :profile_picture, service: :google
    validates :profile_picture,  blob: { content_type: :image }

    def self.from_google(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |restaurant|
        #campi da assegnare al modello restaurant, tramite oauth
        restaurant.uid = auth.uid
        restaurant.provider = auth.provider
        restaurant.email = auth.info.email
        restaurant.password = Devise.friendly_token[0, 20]
        #creo un username, tecnicamente univoco, in maniera incrementale per disponibilità
        #i = -1
        #s_username = auth.info.first_name.to_s << "-" << auth.info.last_name.to_s
        #t_username = s_username
        #while (Reviewer.exists?(username: t_username))
        #  i += 1
        #  t_username = s_username + i.to_s
        #end
        #reviewer.username = t_username
        restaurant.username = "test"
        restaurant.profile_picture.attach(io: URI.parse(auth.info.image).open, filename: "profile_picture.jpg")
        restaurant.description = "Ciao mi chiamo " << auth.info.name << " e sono registrato tramite account Google! "
      end
    end
end
