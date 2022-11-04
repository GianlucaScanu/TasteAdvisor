class Reviewer < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
    #:omniauthable, omniauth_providers: [:google_oauth2]
    validates :username, presence: true
    validates :username, uniqueness: true
    
    has_many :review

    has_one_attached :avatar, service: :google
    
end
