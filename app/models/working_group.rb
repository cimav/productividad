class WorkingGroup < ApplicationRecord
  belongs_to :organization
  belongs_to :person

  ACTIVE = 1
  INACTIVE = 99
end
