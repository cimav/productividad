class Association < ApplicationRecord
  belongs_to :country

  ACTIVE    = 1
  INACTIVE  = 99

  STATUS = {
  	ACTIVE => 'Activa',
  	INACTIVE => 'Inactiva'
  }

  def status_text 
  	STATUS[status.to_i]
  end
end
