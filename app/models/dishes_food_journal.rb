class DishesFoodJournal < ApplicationRecord
  belongs_to :dish
  belongs_to :food_journal
end
