class ConferenceWork < ApplicationRecord

  belongs_to :conference
  belongs_to :person  
  has_many :product_participants, :as => :attachable
  has_many :acknowledgments, :as => :attachable
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  SENT      = 1
  ACCEPTED  = 2
  PUBLISHED = 3
  REJECTED  = 99

  STATUS = {
  	SENT => 'Enviado',
  	ACCEPTED => 'Aceptado',
  	PUBLISHED => 'Publicado',
  	REJECTED => 'Rechazado'
  }

  POSTER = 1
  RESUME = 2
  ORAL   = 3
  OTHER  = 4

  WORK_TYPES = {
    POSTER => 'Poster',
    RESUME => 'Resumen',
    ORAL   => 'Presentación Oral',
    OTHER  => 'Otro'
  }

  

  def product_name 
    "Trabajos"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def status_class
    case status 
    when SENT
      "is-primary"
    when ACCEPTED
      "is-link"
    when PUBLISHED
      "is-success"
    when REJECTED
      "is-danger"  
    end
  end

  def work_type_text 
    WORK_TYPES[status.to_i]
  end


  def field_text(f)
    f
  end

  def can_edit(person_id)
    editable = false
    if self.person_id == person_id
      editable = true
    elsif self.product_participants.where(person_id: person_id, status: ProductParticipant::ACTIVE).count >= 1
      editable = true
    end
    editable
  end
end

