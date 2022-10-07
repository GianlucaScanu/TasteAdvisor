json.extract! restaurant, :id, :name, :username, :website, :description, :profile_picture, :mail, :password, :telephone_number, :address, :created_at, :updated_at
json.url restaurant_url(restaurant, format: :json)
