json.extract! city, :id, :name, :lat, :long, :status, :country_id, :created_at, :updated_at
json.url city_url(city, format: :json)
