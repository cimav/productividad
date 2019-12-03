json.extract! journal_article, :id, :title, :sent_date, :accepted_date, :published_date, :journal_id, :authors, :volume, :issue, :pages, :doi, :abstract, :person_id, :status, :created_at, :updated_at
json.url journal_article_url(journal_article, format: :json)
