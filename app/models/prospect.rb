class Prospect < ApplicationRecord
  belongs_to :person  
  belongs_to :country
  has_many :activity_logs, :as => :item
  has_many :prospect_participants
  has_many :prospect_teams
  has_many :prospect_status_changes


  has_rich_text :needs

  after_create :add_code

  INITIAL     = 1
  ASSIGNED    = 2
  ACCEPTED    = 3
  SUSPENDED   = 4
  CANCELED    = 5
  REJECTED    = 6
  DELETED     = 99

  STATUS = {
  	INITIAL  => 'Inicial',
    ASSIGNED  => 'Asignado',
    ACCEPTED => 'Aceptado',
    SUSPENDED   => 'Suspendido',
    CANCELED    => 'Cancelado',
    REJECTED    => 'Rechazado'
  }

  STATUS_MENU = {
    INITIAL  => 'Regresar a inicial',
    ASSIGNED  => 'Definir equipo de trabajo',
    ACCEPTED => 'Se acepta la propuesta',
    SUSPENDED   => 'Suspender',
    CANCELED    => 'Cancelar',
    REJECTED    => 'Rechazar'
  }

  DECISION_NONE = 1
  DECISION_RECOMMENDS = 2
  DECISION_DECIDES = 3

  DECISION_TYPES = {
  	DECISION_NONE => 'No tiene decisión',
  	DECISION_RECOMMENDS => 'Recomienda',
  	DECISION_DECIDES => 'Decide'
  }


  STATUS_ICON = {
    INITIAL  => 'fa-circle',
    ASSIGNED  => 'fa-user',
    ACCEPTED => 'fa-handshake',
    SUSPENDED   => 'fa-pause',
    CANCELED    => 'fa-times',
    REJECTED    => 'fa-times'
  }

  STATUS_CLASS = {
    INITIAL  => 'is-primary',
    ASSIGNED  => 'is-link',
    ACCEPTED => 'is-success',
    SUSPENDED   => 'is-warning',
    CANCELED    => 'is-danger',
    REJECTED    => 'is-danger'
  }

  STATUS_TEXT_CLASS = {
    INITIAL  => 'has-text-primary',
    ASSIGNED  => 'has-text-link',
    ACCEPTED => 'has-text-success',
    SUSPENDED   => 'has-text-warning',
    CANCELED    => 'has-text-danger',
    REJECTED    => 'has-text-danger'
  }
  
  STATUS_TIMELINE = {
    INITIAL  => 'Inicio del contacto',
    ASSIGNED  => 'Se definió el equipo',
    ACCEPTED => 'El prospecto acepto propuesta',
    SUSPENDED   => 'Negociación suspendida',
    CANCELED    => 'El prospecto canceló',
    REJECTED    => 'Propuesta rechazada'
  }

  def product_name 
    "Prospecto"
  end 

  def add_code
    con = Prospect.where("YEAR(created_at) = :year", {:year => Date.today.year}).maximum('consecutive')
    if con.nil?
      con = 1
    else
      con += 1
    end
    consecutive = "%04d" % con
    self.consecutive = con
    year = Date.today.year.to_s.last(2)
    self.code = "#{year}/#{consecutive}"
    self.save(:validate => false)
  end

  def show_url
    if Rails.env.development? 
      server = "http://localhost:3000"
    else
      server = "https://sip.cimav.edu.mx"
    end

    "#{server}/ir-a/prospecto/#{self.code}"
  end

  def decision_type_text
    DECISION_TYPES[decision_type.to_i]
  end

  def status_text 
    STATUS[status.to_i]
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
end
