class Project < ApplicationRecord
  belongs_to :person  
  has_many :activity_logs, :as => :item
  has_many :project_messages
  has_many :project_participants
  has_many :project_task_lists

  has_rich_text :objectives
  has_rich_text :results

  DEFINITION  = 1
  NEGOTATION  = 2
  IN_PROCESS = 3
  CONCLUDED   = 4
  SUSPENDED   = 5
  CANCELED    = 6
  REJECTED    = 7

  STATUS = {
  	DEFINITION  => 'En definición',
    NEGOTATION  => 'En negociación',
    IN_PROCESS => 'En proceso',
    CONCLUDED   => 'Concluido',
    SUSPENDED   => 'Suspendido',
    CANCELED    => 'Cancelado',
    REJECTED    => 'Rechazado'
  }

  MIXED         = 1
  SECTOR        = 2
  INTERNATIONAL = 3
  INSTITUTIONAL = 4
  INTERNAL      = 5
  OTHER         = 6

  SOURCE_TYPES = {
    MIXED         => "Mixtos",
    SECTOR        => "Sectorial",
    INTERNATIONAL => "Internacional",
    INSTITUTIONAL => "Institucional",
    INTERNAL      => "Vinculación",
    OTHER         => "Otro"
  }

  BASIC   = 1
  APPLIED = 2
  TECH    = 3

  RESEARCH_TYPES = {
    BASIC => "Básica",
    APPLIED => "Aplicada",
    TECH => "Desarrollo Tecnológico"  
  }
  

  def product_name 
    "Proyecto"
  end 

  def status_text 
  	STATUS[status.to_i]
  end

  def source_type_text 
    SOURCE_TYPES[source_type.to_i]
  end

  def research_type_text 
    RESEARCH_TYPES[research_type.to_i]
  end

  def status_class
    case status 
    when DEFINITION
      "is-info"
    when NEGOTATION
      "is-link"
    when IN_PROCCESS
      "is-success"
    when CONCLUDED
      "is-primary"
    when SUSPENDED
      "is-danger"  
    when CANCELED
      "is-danger"  
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

