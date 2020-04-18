class ProjectTask < ApplicationRecord
  belongs_to :project_task_list
  has_rich_text :content
  belongs_to :person
  belongs_to :assigned, foreign_key: 'assigned_to', class_name: 'Person', optional: true

  ACTIVE = 1
  DELETED = 99

  NOT_DONE = 1
  DONE = 2

end