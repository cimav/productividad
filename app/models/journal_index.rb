class JournalIndex < ApplicationRecord
  belongs_to :journal
  belongs_to :indexer
end
