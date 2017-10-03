json.extract! order, :id, :sandwich, :condiments, :quantity, :created_at, :updated_at
json.url order_url(order, format: :json)
