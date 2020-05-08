class Association < ApplicationRecord
  belongs_to :country
  has_many :association_members

  ACTIVE    = 1
  INACTIVE  = 99

  NOT_VALIDATED = 0
  VALIDATED     = 1

  STATUS = {
  	ACTIVE => 'Activa',
  	INACTIVE => 'Inactiva'
  }

  def status_text 
  	STATUS[status.to_i]
  end
end
