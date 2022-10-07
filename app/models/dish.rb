class Dish < ApplicationRecord
    validates :name, :price, :category, presence: true    
    validates :category, inclusion: { in: 0..3 }
    
    belongs_to :restaurant
    has_many :review

end
