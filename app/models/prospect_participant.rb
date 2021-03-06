class ProspectParticipant < ApplicationRecord
  belongs_to :person, optional: true
  belongs_to :suggested_by_person, foreign_key: 'suggested_by', class_name: 'Person', optional: true

  belongs_to :prospect 

  ACTIVE = 1
  DELETED = 99

  LEADER = 1
  PARTICIPANT = 2 

  PARTICIPANT_TYPES = {
    LEADER => 'Líder',
    PARTICIPANT => 'Participante'
  }

  def participant_type_text 
    PARTICIPANT_TYPES[participant_type.to_i]
  end


  def full_name
    person.full_name
  end
end
