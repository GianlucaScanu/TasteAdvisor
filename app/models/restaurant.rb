class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :name, :username, presence: true
    validates :username,  uniqueness: true
    validates :password, presence: true, on: :create
    validates :password_confirmation, presence: true, on: :create

    has_one_attached :profile_picture, service: :google
    validates :profile_picture,  blob: { content_type: :image }
    #has_one :omniuser
    after_initialize :init_values

    def self.from_google(auth)
      where(provider: auth.provider, uid: auth.uid).first_or_create do |restaurant|
        #campi da assegnare al modello restaurant, tramite oauth
        restaurant.uid = auth.uid
        restaurant.provider = auth.provider
        restaurant.email = auth.info.email
        restaurant.password = Devise.friendly_token[0, 20]
        #creo un username, tecnicamente univoco, in maniera incrementale per disponibilità
        i = -1
        s_username = auth.info.first_name.to_s << "-" << auth.info.last_name.to_s
        t_username = s_username
        while (Restaurant.exists?(username: t_username))
          i += 1
          t_username = s_username + i.to_s
        end
        restaurant.name = t_username
        restaurant.username = t_username
        restaurant.profile_picture.attach(io: URI.parse(auth.info.image).open, filename: "profile_picture.jpg")
        restaurant.description = "Sono il ristorante " << auth.info.name << " e sono registrato tramite account Google! "
      end
    end

    def init_values
      self.ta_rating ||= 0.0
    end
    
end
