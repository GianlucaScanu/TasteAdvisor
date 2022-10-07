class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    validates :name, :username, :telephone_number, :address, presence: true
    validates :username,  uniqueness: true

    has_many :dish
end
