class PersonResearchLine < ApplicationRecord
  belongs_to :person
  belongs_to :research_line
end
