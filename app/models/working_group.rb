class WorkingGroup < ApplicationRecord
  belongs_to :organization
  belongs_to :person
  has_many :working_group_members
  has_many :working_group_roles

  ACTIVE = 1
  INACTIVE = 99
end
