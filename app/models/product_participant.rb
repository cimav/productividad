class ProductParticipant < ApplicationRecord
  belongs_to :attachable, polymorphic: true 
  belongs_to :person, optional: true

  FIRST_AUTHOR   = 1
  CORRESPONDING  = 2
  PARTICIPANT    = 99

  PARTICIPATION = {
  	FIRST_AUTHOR => 'Primer autor',
  	CORRESPONDING => 'Correspondencia',
  	PARTICIPANT => 'Participante'
  }

  DELETED    = -1
  ACTIVE     = 1
  UNASSIGNED = 2

  NOT_CLASSIFIED = 0
  IS_ORG         = 1
  IS_EXTERNAL    = 9999

  PARTICIPANT_TYPE = {
    NOT_CLASSIFIED => 'No clasificado',
    IS_ORG => 'De la organización',
    IS_EXTERNAL => 'Externo'
  }

  def participant_type_text 
  	PARTICIPANT_TYPE[participant_type.to_i]
  end

  def participation_text 
  	PARTICIPATION[participation.to_i]
  end
end
