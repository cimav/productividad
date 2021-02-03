class ProspectStatusChange < ApplicationRecord
  belongs_to :person  
  belongs_to :prospect 
  has_rich_text :content

  ACTIVE = 1
  DELETED = 99
end
