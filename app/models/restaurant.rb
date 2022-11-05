class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, :username, presence: true
    validates :username,  uniqueness: true

    has_one_attached :profile_picture, service: :google
    validates :profile_picture,  blob: { content_type: :image }
end
