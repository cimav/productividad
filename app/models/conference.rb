class Conference < ApplicationRecord
  belongs_to :country
  has_many :conference_papers
  has_many :conference_works

  NOT_VALIDATED = 0
  VALIDATED     = 1

end