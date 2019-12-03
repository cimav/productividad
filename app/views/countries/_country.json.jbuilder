json.extract! country, :id, :name, :code, :lat, :long, :status, :created_at, :updated_at
json.url country_url(country, format: :json)
