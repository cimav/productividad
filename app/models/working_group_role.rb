class WorkingGroupRole < ApplicationRecord
  belongs_to :working_group

  ACTIVE = 1
  INACTIVE = 99

end
