class Department < ApplicationRecord
  belongs_to :organization
  has_many   :research_lines
  has_many   :people

  ACTIVE = 1
  INACTIVE = 99
end
