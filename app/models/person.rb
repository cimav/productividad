class Person < ApplicationRecord
  belongs_to :organization, optional: true
  belongs_to :department, optional: true
  belongs_to :person, optional: true

  has_many   :person_roles
  belongs_to :person_type, optional: true
  has_many   :roles, through: :person_roles
  has_many   :experiences
  has_many   :educations
  has_many   :journal_articles
  

  STATUS_ACTIVE = 1
  STATUS_INACTIVE = 2

  def full_name
  	"#{first_name} #{last_name}"
  end

  def shortname 
    self.email.split('@')[0] rescue 'Email Invalido'
  end

  def display_url
    "https://cimav.edu.mx/foto/#{self.shortname}/256"
  end

end
