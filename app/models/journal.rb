class Journal < ApplicationRecord
  belongs_to :country
  has_many   :journal_impact_factors
  has_many   :journal_indices, :dependent => :delete_all


  NOT_VALIDATED = 0
  VALIDATED     = 1


  def impact_factor 
  	self.journal_impact_factors.order(year: :desc).first rescue '-'
  end
end
