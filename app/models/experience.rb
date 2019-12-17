class Experience < ApplicationRecord
  belongs_to :person
  belongs_to :experience_type
  
  DELETED    = -1
  ACTIVE     = 1
end
