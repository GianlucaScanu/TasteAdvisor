require 'rails_helper'

RSpec.describe Restaurant, type: :model do
    
    it 'has a name' do
        restaurant = Restaurant.new(
            name: nil,
            username: 'pizza da mario',
            email: 'test@test.com',
            password: 'password'
        )

        expect(restaurant).to_not be_valid
        restaurant.name = 'test'
        expect(restaurant).to be_valid
    end

    it 'has a username' do
        restaurant = Restaurant.new(
            name: 'ristorante',
            username: nil,
            email: 'test@test.com',
            password: 'password'
        )

        expect(restaurant).to_not be_valid
        restaurant.username = 'pizza da mario'
        expect(restaurant).to be_valid        
    end

    it 'has a email' do
        restaurant = Restaurant.new(
            name: 'ristorante',
            username: 'test',
            email: nil,
            password: 'password'
        )

        expect(restaurant).to_not be_valid
        restaurant.email = 'test@test.com'
        expect(restaurant).to be_valid          
    end
    
    it 'has a password' do
        restaurant = Restaurant.new(
            name: 'ristorante',
            username: 'miotest',
            email: 'test@test.com',
            password: nil
        )

        expect(restaurant).to_not be_valid
        restaurant.password = 'password'
        expect(restaurant).to be_valid         
    end

end