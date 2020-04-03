class InvitedConference < ApplicationRecord
  belongs_to :conference
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  PRESENTATION = 1
  REJECTED  = 99

  STATUS = {
  	PRESENTATION => 'Presentación',
  	REJECTED => 'Rechazado'
  }
  

  def product_name 
    "Conferencias por Invitación"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def status_class
    case status 
    when PRESENTATION
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


