class Person < ApplicationRecord
  belongs_to :organization
  belongs_to :department
  belongs_to :people
  has_many   :person_roles
  belongs_to :person_type
  has_many   :roles, through: :person_roles
  

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
