class Topic < ApplicationRecord
  has_many :person, :through => :topic_persons
end
