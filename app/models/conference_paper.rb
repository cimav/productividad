class ConferencePaper < ApplicationRecord

  belongs_to :conference
  belongs_to :person  
  has_many :product_participants, :as => :attachable
  has_many :acknowledgments, :as => :attachable
  has_many :product_cites, :as => :attachable
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

  def product_name 
    "Artículo en Congreso"
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
