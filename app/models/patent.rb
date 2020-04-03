class Patent < ApplicationRecord
  belongs_to :person  
  has_many :product_participants, :as => :attachable
  has_many :acknowledgments, :as => :attachable
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  REGISTER    = 1
  FORM_EXAM   = 2
  PUBLISHED   = 3
  EXAMINATION = 4
  GRANTED     = 5
  REJECTED    = 99


  STATUS = {
  	REGISTER    => 'Registro',
    FORM_EXAM   => 'Examen de forma',
    PUBLISHED   => 'Publicación',
    EXAMINATION => 'Examen de fondo',
    GRANTED     => 'Título otorgado',
    REJECTED    => 'Rechazada'
  }

  def product_name 
    "Patentes"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def status_class
    case status 
    when REGISTER
      "light-green lighten-3"
    when FORM_EXAM
      "lime lighten-3"
    when PUBLISHED
      "cyan lighten-3"
    when EXAMINATION
      "teal"
    when GRANTED
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
