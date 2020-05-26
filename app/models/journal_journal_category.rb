class JournalJournalCategory < ApplicationRecord
  belongs_to :journal
  belongs_to :journal_category
end
