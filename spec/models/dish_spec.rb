require 'rails_helper'

RSpec.describe Dish, type: :model do
    
    current_reviewer = Reviewer.first_or_create(username: 'test13', email: 'test13@test13.tti', password: 'password', password_confirmation: 'password')
    current_restaurant = Restaurant.first_or_create(name: 'Pizza da Mario', username: 'Pizza da Mario', website: 'www.pizzadamario.tti', description: 'tti', telephone_number: '1234567890') 
    
    describe "create" do
        it 'has a name' do
            dish = Dish.new(
                name: nil,
                price: 5.0,
                category: 1,
                restaurant_id: current_restaurant.id
            )

            expect(dish).to_not be_valid
            dish.name = 'pizza'
            expect(dish).to be_valid
        end

        it 'has a price' do
            dish = Dish.new(
                name: 'pippo',
                price: nil,
                category: 1,
                restaurant_id: current_restaurant.id
            )

            expect(dish).to_not be_valid
            dish.price = 6.50
            expect(dish).to be_valid
        end

        it 'has a category' do
            dish = Dish.new(
                name: "bucatina all'amatriciana",
                price: 7.0,
                category: nil,
                restaurant_id: current_restaurant.id
            )

            expect(dish).to_not be_valid
            dish.category = 3
            expect(dish).to be_valid
        end

        it 'has a valid category between 0 and 3' do
            dish = Dish.new(
                name: "bucatina all'amatriciana",
                price: 7.0,
                category: -7,
                restaurant_id: current_restaurant.id
            )
            
            expect(dish).to_not be_valid
            dish.category = 11
            expect(dish).to_not be_valid
            dish.category = 1
            expect(dish).to be_valid
        end

        it 'belongs to a restaurant' do
            dish = Dish.new(
                name: 'carbonara',
                price: 9.0,
                category: 1,
                restaurant_id: nil
            )

            expect(dish).to_not be_valid
            dish.restaurant_id = current_restaurant.id
            expect(dish).to be_valid
        end
    end
end