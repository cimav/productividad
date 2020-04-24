class ProjectStatusChange < ApplicationRecord
  belongs_to :person  
  belongs_to :project 
  has_rich_text :content

  ACTIVE = 1
  DELETED = 99
end
