class Award < ApplicationRecord
  belongs_to :country
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  STATE          = 1
  NATIONAL       = 2
  INTERNATIONAL  = 3

  AWARD_TYPES = {
  	STATE => 'Estatal',
  	NATIONAL => 'Nacional',
  	INTERNATIONAL => 'Internacional'
  }
  

  def product_name 
    "Reconocimientos"
  end 

  def award_type_text 
  	AWARD_TYPES[award_type.to_i]
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





