class ActivityLog < ApplicationRecord
  belongs_to :item, polymorphic: true 
  belongs_to :person, optional: true
end
