class Review < ApplicationRecord
    validates :rating1, :rating2, :rating3, presence: true

    validates :rating1, inclusion: { in: 1..5} #gusto
    validates :rating2, inclusion: { in: 1..5} #impiattamento
    validates :rating3, inclusion: { in: 1..5} #originalità

    belongs_to :reviewer
	belongs_to :restaurant
	belongs_to :dish

    #after_validation :increase_dish_number_of_review, :update_avg_rating
    
    private
        def increase_dish_number_of_review
            #credits. https://stackoverflow.com/questions/12329687/how-to-update-value-of-a-models-attribute, https://guides.rubyonrails.org/active_record_basics.html#update
            dish = Dish.find(@dish)
            dish.number_of_reviews += 1
            dish.save
        end
        
        def update_avg_rating
            dish = Dish.find(@dish)

            accumulator = 0
            counter = 0

            @reviews = Review.all
            #ricalcolo la media, riprendendo la media di ogni recensione inserente al piatto, sommandole e poi dividendole per la nuova media
            reviews.each do |review|
                if(review.dish == @dish)
                    accumulator += (review.rating1 + review.rating2 + review.rating3)/3
                    counter += 1
                end
            end

            #tecnicamente dovrebbe eseguire questo metodo dopo aver validato il modello, quindi in Review.all dovrebbe comparire anche questa review
            new_avg = accumulator/counter 

            dish.avg_rating = new_avg
            dish.save
        end
end
