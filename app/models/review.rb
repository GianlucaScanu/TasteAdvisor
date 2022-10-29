class Review < ApplicationRecord
    validates :rating1, :rating2, :rating3, presence: true

    validates :rating1, inclusion: { in: 1..5} #gusto
    validates :rating2, inclusion: { in: 1..5} #impiattamento
    validates :rating3, inclusion: { in: 1..5} #originalità

    belongs_to :reviewer
	#belongs_to :restaurant
	belongs_to :dish

    after_validation :update_avg_rating_and_number_of_review
    
    private
    
        #FUNZIONA MA DA SISTEMARE!
        #after_validation viene applicato prima di salvare il modello sull dbs? in base a questo vanno modificate delle righe 
        
        def update_avg_rating_and_number_of_review
            #credits. https://stackoverflow.com/questions/12329687/how-to-update-value-of-a-models-attribute, https://guides.rubyonrails.org/active_record_basics.html#update
            
            dish = Dish.find(dish_id)

            accumulator = 0
            counter = 0

            #ricalcolo la media, riprendendo la media di ogni recensione inserente al piatto, sommandole e poi dividendole per la nuova media
            (Review.all).each do |review|
                if(review.dish_id == dish_id)
                    counter += 1
                    accumulator += (review.rating1 + review.rating2 + review.rating3)/3
                end
            end

            #tecnicamente dovrebbe eseguire questo metodo dopo aver validato il modello, quindi in Review.all dovrebbe comparire anche questa review (?)
            if(counter != 0)
                new_avg = accumulator/counter 
            elsif 
                new_avg = 0
            end

            dish.avg_rating = new_avg
            dish.number_of_reviews = (counter + 1)

            dish.save
        end
end
