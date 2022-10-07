json.extract! dish, :id, :name, :number_of_reviews, :price, :category, :avg_rating, :imgs, :created_at, :updated_at
json.url dish_url(dish, format: :json)
