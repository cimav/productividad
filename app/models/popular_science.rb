class PopularScience < ApplicationRecord
  belongs_to :country
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item


  PRINT      = 1
  CONFERENCE = 2
  WORKSHOP   = 3
  VISIT      = 4
  INTERVIEW  = 5
  EVENT      = 6


  ACTIVITY_TYPES = {
    PRINT      => 'Medio impreso',
    CONFERENCE => 'Conferencia',
    WORKSHOP   => 'Taller',
    VISIT      => 'Visita',
    INTERVIEW  => 'Entrevista',
    EVENT      => 'Evento'
  }
  

  def product_name 
    "Difusión y Divulgación"
  end 

  def activity_type_text 
  	ACTIVITY_TYPES[activity_type.to_i]
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





