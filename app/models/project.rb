class Project < ApplicationRecord
  belongs_to :person  
  has_many :activity_logs, :as => :item
  has_many :project_status_changes
  has_many :project_messages
  has_many :project_participants
  has_many :project_documents
  has_many :project_task_lists
  has_many :gantt_tasks
  has_many :gantt_links

  has_rich_text :objectives
  has_rich_text :results

  DEFINITION  = 1
  NEGOTIATION  = 2
  IN_PROCESS = 3
  CONCLUDED   = 4
  SUSPENDED   = 5
  CANCELED    = 6
  REJECTED    = 7

  STATUS = {
  	DEFINITION  => 'En definición',
    NEGOTIATION  => 'En negociación',
    IN_PROCESS => 'En proceso',
    CONCLUDED   => 'Concluido',
    SUSPENDED   => 'Suspendido',
    CANCELED    => 'Cancelado',
    REJECTED    => 'Rechazado'
  }

  STATUS_CLASS = {
    DEFINITION  => 'is-primary',
    NEGOTIATION  => 'is-link',
    IN_PROCESS  => 'is-info',
    CONCLUDED   => 'is-success',
    SUSPENDED   => 'is-warning',
    CANCELED    => 'is-danger',
    REJECTED    => 'is-danger'
  }

  STATUS_TEXT_CLASS = {
    DEFINITION  => 'has-text-primary',
    NEGOTIATION  => 'has-text-link',
    IN_PROCESS  => 'has-text-info',
    CONCLUDED   => 'has-text-success',
    SUSPENDED   => 'has-text-warning',
    CANCELED    => 'has-text-danger',
    REJECTED    => 'has-text-danger'
  }

  STATUS_TIMELINE = {
    DEFINITION  => 'Definición del proyecto',
    NEGOTIATION  => 'Inicio de negociación',
    IN_PROCESS  => 'Arranque del proyecto',
    CONCLUDED   => 'Proyecto finalizado',
    SUSPENDED   => 'Suspensión del proyecto',
    CANCELED    => 'Cancelación del proyecto',
    REJECTED    => 'Proyecto rechazado'
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

  STATUS_ICON = {
    Project::DEFINITION  => "fa-circle",
    Project::NEGOTIATION => "fa-handshake",
    Project::IN_PROCESS  => "fa-play",
    Project::CONCLUDED   => "fa-check",
    Project::SUSPENDED   => "fa-pause",
    Project::CANCELED    => "fa-times",
    Project::REJECTED    => "fa-times"
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
    STATUS_CLASS[status.to_i]
  end

  def status_text_class
    STATUS_TEXT_CLASS[status.to_i]
  end

  def status_icon
    STATUS_ICON[status.to_i]
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

