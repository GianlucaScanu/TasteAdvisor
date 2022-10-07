class Reviewer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    #validates :name, :surname, :username, presence: true
    #validates :username, uniqueness: true

    has_many :review
    
end
