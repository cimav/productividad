json.extract! conference_paper, :id, :title, :sent_date, :accepted_date, :published_date, :conference, :authors, :abstract, :person, :status, :created_at, :updated_at
json.url conference_paper_url(conference_paper, format: :json)
