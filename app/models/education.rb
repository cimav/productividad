class Education < ApplicationRecord
  belongs_to :organization
  belongs_to :degree
  belongs_to :person
  
  DELETED    = -1
  ACTIVE     = 1
end
