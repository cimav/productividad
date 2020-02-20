class ProductCite < ApplicationRecord
  belongs_to :attachable, polymorphic: true 
  belongs_to :person, optional: true
  belongs_to :journal

  DELETED    = -1
  ACTIVE     = 1
  UNASSIGNED = 2

end
