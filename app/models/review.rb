class Review < ApplicationRecord
    validates :rating1, :rating2, :rating3, presence: true

    validates :rating1, inclusion: { in: 1..5} #gusto
    validates :rating2, inclusion: { in: 1..5} #impiattamento
    validates :rating3, inclusion: { in: 1..5} #originalità

    #belongs_to :reviewer
	#belongs_to :restaurant
	belongs_to :dish

    has_many_attached :images, service: :google
    validates :images,  blob: { content_type: :image }
    
    after_create :update_avg_rating_and_number_of_review
    after_update :update_avg_rating_and_number_of_review
    after_destroy :update_avg_rating_and_number_of_review

    private

        def update_avg_rating_and_number_of_review
            
            #credits. https://stackoverflow.com/questions/12329687/how-to-update-value-of-a-models-attribute, https://guides.rubyonrails.org/active_record_basics.html#update
            
            dish = Dish.find_by_id(dish_id)
            #dish = Dish.find(52)
            #tronca le divisioni senza .0 o .to_f
            accumulator = 0.0
            counter = 0.0

            #ricalcolo la media, riprendendo la media di ogni recensione inserente al piatto, sommandole e poi dividendole per la nuova media
            (Review.all).each do |review|
                if(review.dish_id == dish_id)
                    counter += 1.0
                    accumulator += (review.rating1.to_f + review.rating2.to_f + review.rating3.to_f)/3.to_f
                end
            end

            if(counter != 0)
                new_avg = accumulator.to_f/counter.to_f
            else
                new_avg = 0
            end

            dish.avg_rating = new_avg.to_f
            dish.number_of_reviews = counter.to_f

            dish.save
        end
        
    
end
