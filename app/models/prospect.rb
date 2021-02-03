class Prospect < ApplicationRecord
  belongs_to :person  
  belongs_to :country
  has_many :activity_logs, :as => :item
  has_many :prospect_participants
  has_many :prospect_status_changes


  has_rich_text :needs

  INITIAL     = 1
  ASSIGNED    = 2
  ACCEPTED    = 3
  SUSPENDED   = 4
  CANCELED    = 5
  REJECTED    = 6

  STATUS = {
  	INITIAL  => 'Inicial',
    ASSIGNED  => 'Asignado',
    ACCEPTED => 'Aceptado',
    SUSPENDED   => 'Suspendido',
    CANCELED    => 'Cancelado',
    REJECTED    => 'Rechazado'
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
  

  def product_name 
    "Prospecto"
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
