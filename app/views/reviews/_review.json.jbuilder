json.extract! review, :id, :rating1, :rating2, :rating3, :description, :imgs, :created_at, :updated_at
json.url review_url(review, format: :json)
