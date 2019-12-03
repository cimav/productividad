json.extract! person, :id, :first_name, :last_name, :email, :description, :start_date, :end_date, :reload, :status, :organization_id, :department_id, :people_id, :created_at, :updated_at
json.url person_url(person, format: :json)
