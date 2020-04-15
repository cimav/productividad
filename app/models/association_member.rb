class AssociationMember < ApplicationRecord
  belongs_to :association_network, foreign_key: 'association_id', class_name: 'Association', optional: true
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  ACTIVE = 1
  INACTIVE  = 99

  STATUS = {
  	ACTIVE => 'Activo',
  	INACTIVE => 'Inactivo'
  }
  

  def product_name 
    "Asociaciones y Redes"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def status_class
    case status 
    when ACTIVE
      "is-primary"
    when INACTIVE
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




