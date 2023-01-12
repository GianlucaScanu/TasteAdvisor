class Dish < ApplicationRecord
    validates :name, :price, :category, presence: true    
    validates :category, inclusion: { in: 0..3 }
    
    belongs_to :restaurant
    has_many :review

    has_many_attached :images, service: :google
    validates :images,  blob: { content_type: :image }

    before_destroy :destroy_referenced_reviews

    private
        def destroy_referenced_reviews
            (Review.all).each do |review|
                if(review.dish_id == self.id)
                    review.destroy
                end
            end
        end
end
