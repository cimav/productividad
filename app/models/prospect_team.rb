class ProspectTeam < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :prospect 

  ACTIVE = 1
  DELETED = 99

  LEADER = 1
  PARTICIPANT = 2 
  NOT_PARTICIPANT = 3

  PARTICIPANT_TYPES = {
    LEADER => 'Líder',
    PARTICIPANT => 'Participante',
    NOT_PARTICIPANT => 'No Participa'
  }

  def participant_type_text 
    PARTICIPANT_TYPES[participant_type.to_i]
  end


  def full_name
    person.full_name
  end
end
