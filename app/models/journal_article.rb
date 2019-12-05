class JournalArticle < ApplicationRecord
  belongs_to :journal
  belongs_to :person  
  has_many :product_participants, :as => :attachable
  has_many :acknowledgments, :as => :attachable
  has_many :product_files, :as => :attachable


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
    "Artículo en Revista"
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

end
