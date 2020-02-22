json.extract! book, :id, :title, :authors, :book_type, :publisher, :is_refereed, :country_id, :status, :sent_date, :accepted_date, :published_date, :pages, :isbn, :created_at, :updated_at
json.url book_url(book, format: :json)
