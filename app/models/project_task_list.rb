class ProjectTaskList < ApplicationRecord
  belongs_to :project
  belongs_to :person
  has_many :project_tasks
  has_rich_text :content

  ACTIVE = 1
  DELETED = 99

end