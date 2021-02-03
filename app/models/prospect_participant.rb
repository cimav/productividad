class ProspectParticipant < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :prospect 

  ACTIVE = 1
  DELETED = 99

  LEADER = 1
  PARTICIPANT = 2 

  PARTICIPANT_TYPES = {
    LEADER => 'Lider',
    PARTICIPANT => 'Participante',
  }

  def participant_type_text 
    PARTICIPANT_TYPES[participant_type.to_i]
  end


  def full_name
    person.full_name
  end
end
