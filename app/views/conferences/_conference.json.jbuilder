json.extract! conference, :id, :name, :place, :country, :start_date, :end_date, :organizer, :is_international, :is_refereed, :created_at, :updated_at
json.url conference_url(conference, format: :json)
