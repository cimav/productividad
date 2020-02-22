class Book < ApplicationRecord
  belongs_to :person  
  belongs_to :country
  has_many :product_participants, :as => :attachable
  has_many :acknowledgments, :as => :attachable
  has_many :product_cites, :as => :attachable
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item


  COMPLETE = 1
  CHAPTER  = 2

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

  BOOK_TYPE = {
  	COMPLETE => 'Libro completo',
  	CHAPTER => 'Capítulo en libro'
  }

  def product_name 
    "Libro"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def type_text 
  	BOOK_TYPE[book_type.to_i]
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
