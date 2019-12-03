class Organization < ApplicationRecord
  belongs_to :city
  belongs_to :country
  belongs_to :organization
end
