class Conference < ApplicationRecord
  belongs_to :country
  has_many :conference_papers
end