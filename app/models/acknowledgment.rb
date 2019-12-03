class Acknowledgment < ApplicationRecord
  belongs_to :attachable, polymorphic: true 
  belongs_to :person, optional: true

  ACTIVE = 1
  DELETED = 99
end
