class ResearchGroup < ApplicationRecord
  belongs_to :department

  ACTIVE = 1
  INACTIVE = 99
end
