class ProjectParticipant < ApplicationRecord
  belongs_to :person
  belongs_to :project 

  ACTIVE = 1
  DELETED = 99

  LEADER = 1
  PARTICIPANT = 2

  ROLE_TYPES = {
    PARTICIPANT => 'Participante',
  	LEADER => 'Líder'
  }

  NOT_CLASSIFIED = 0
  IS_ORG         = 1
  IS_EXTERNAL    = 9999

  PARTICIPANT_TYPES = {
    NOT_CLASSIFIED => 'No clasificado',
    IS_ORG => 'De la organización',
    IS_EXTERNAL => 'Externo'
  }

  def participant_type_text 
    PARTICIPANT_TYPES[participant_type.to_i]
  end

  def role_type_text 
  	ROLE_TYPES[participant_type.to_i]
  end

  def full_name
    person.full_name
  end

end
