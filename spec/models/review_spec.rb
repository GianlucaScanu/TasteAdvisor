require 'rails_helper'

RSpec.describe Review, type: :model do
    
    current_reviewer = Reviewer.first_or_create(username: 'test13', email: 'test13@test13.tti', password: 'password', password_confirmation: 'password')
    current_restaurant = Restaurant.first_or_create(name: 'Pizza da Mario', username: 'Pizza da Mario', website: 'www.pizzadamario.tti', description: 'tti', telephone_number: '1234567890') 
    current_dish = Dish.first_or_create(name: 'pizzaS', number_of_reviews: 0, price: 5.0, category: 1, avg_rating: 0, description: 'è una pizza', restaurant_id: current_restaurant.id, ingredients: 'acqua, farina, lievito')
    
    describe "create" do

        it "has a rating 1 with value between 1 and 5 " do
            review = Review.new(
                rating1: 6,
                rating2: 3,
                rating3: 2,
                description: "A vadil description",
                dish_id: current_dish.id,
                reviewer_id: current_reviewer.id
            )

            expect(review).to_not be_valid
            review.rating1 = 4
            expect(review).to be_valid
        end

        it "has a rating 2 with value between 1 and 5 " do
            review = Review.new(
                rating1: 3,
                rating2: 6,
                rating3: 2,
                description: "A vadil description",
                dish_id: current_dish.id,
                reviewer_id: current_reviewer.id
            )

            expect(review).to_not be_valid
            review.rating2 = 4
            expect(review).to be_valid
        end

        it "has a rating 3 with value between 1 and 5 " do
            review = Review.new(
                rating1: 2,
                rating2: 3,
                rating3: 6,
                description: "A vadil description",
                dish_id: current_dish.id,
                reviewer_id: current_reviewer.id
            )

            expect(review).to_not be_valid
            review.rating3 = 4
            expect(review).to be_valid
        end

        it "has a description" do
            review = Review.new(
                rating1: 1,
                rating2: 3,
                rating3: 2,
                description: "A vadil description",
                dish_id: current_dish.id,
                reviewer_id: current_reviewer.id
            )

            expect(review).to be_valid
        end

        it "has a vaild dish id" do
            review = Review.new(
                rating1: 1,
                rating2: 3,
                rating3: 2,
                description: "A vadil description",
                dish_id: nil,
                reviewer_id: current_reviewer.id
            )

            expect(review).to_not be_valid
            review.dish_id = current_dish.id
            expect(review).to be_valid
        end
    end

end