class EventOrganizer < ApplicationRecord
  belongs_to :conference
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  ACTIVE = 1
  REJECTED  = 99

  STATUS = {
  	ACTIVE => 'Activo',
  	REJECTED => 'Rechazado'
  }

  STAFF = 1
  CHAIRMAN = 2

  ORGANIZER_TYPES = {
  	STAFF => 'Staff',
  	CHAIRMAN => 'Chairman'
  }
  

  def product_name 
    "Organizador de Eventos"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def organizer_type_text 
  	ORGANIZER_TYPES[organizer_type.to_i]
  end

  def status_class
    case status 
    when ACTIVE
      "is-primary"
    when REJECTED
      "is-danger"  
    end
  end

  def field_text(f)
    f
  end

  def can_edit(person_id)
    editable = false
    if self.person_id == person_id
      editable = true
    end
    editable
  end
end



