require 'rails_helper'

RSpec.describe Reviewer, type: :model do

    current_restaurant = Restaurant.first_or_create(name: 'Pizza da Mario', username: 'Pizza da Mario', website: 'www.pizzadamario.tti', description: 'tti', telephone_number: '1234567890') 
    current_dish = Dish.first_or_create(name: 'pizzaS', number_of_reviews: 0, price: 5.0, category: 1, avg_rating: 0, description: 'è una pizza', restaurant_id: current_restaurant.id, ingredients: 'acqua, farina, lievito')

    describe "create" do

        it 'had a username' do
            reviewer = Reviewer.new(
                username: nil,
                description: 'una descrizione TTI',
                email: 'testTTI@test.tti',
                password: 'password',
                full_name: 'testerTTI'
            )
        
            expect(reviewer).to_not be_valid
            reviewer.username = 'usernameTTI'
            expect(reviewer).to be_valid
        end

        it 'had a email' do
            reviewer = Reviewer.new(
                username: 'usernameTTI',
                description: 'una descrizione TTI',
                email: nil,
                password: 'password',
                full_name: 'testerTTI'
            )
        
            expect(reviewer).to_not be_valid
            reviewer.email = 'testTTI@test.tti'
            expect(reviewer).to be_valid
        end

        it 'had a password' do
            reviewer = Reviewer.new(
                username: 'usernameTTI',
                description: 'una descrizione TTI',
                email: 'testTTI@test.tti',
                password: nil,
                full_name: 'testerTTI'
            )
        
            expect(reviewer).to_not be_valid
            reviewer.password = 'password'
            expect(reviewer).to be_valid
        end
    end
end