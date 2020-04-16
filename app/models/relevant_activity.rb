class RelevantActivity < ApplicationRecord
  belongs_to :country
  belongs_to :person  
  has_many :product_files, :as => :attachable
  has_many :activity_logs, :as => :item

  def product_name 
    "Difusión y Divulgación"
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

