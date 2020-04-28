class WorkingGroupMember < ApplicationRecord
  belongs_to :working_group
  belongs_to :working_group_role
  belongs_to :person
  has_many :activity_logs, :as => :item

  ACTIVE = 1
  INACTIVE = 99

  STATUS = {
  	ACTIVE => "Activo",
  	INACTIVE => "Inactivo"
  }

  def role
  	working_group_role.name
  end

  def status_text
  	STATUS[status.to_i]
  end
end
