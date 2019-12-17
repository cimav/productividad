class PersonTopic < ApplicationRecord
  belongs_to :person
  belongs_to :topic
end
