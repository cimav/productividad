class Department < ApplicationRecord
  belongs_to :organization
  has_many   :research_lines
end
