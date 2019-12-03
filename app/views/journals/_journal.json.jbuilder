json.extract! journal, :id, :name, :website, :is_refereed, :is_international, :is_indexed, :issn, :e_issn, :country_id, :created_at, :updated_at
json.url journal_url(journal, format: :json)
