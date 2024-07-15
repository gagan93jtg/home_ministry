class FoodJournal < ApplicationRecord
  DEFAULT_RECENTLY = 10.days

  enum time: {
    breakfast: 0,
    afternoon: 1,
    evening: 2,
    dinner: 3,
  }

  scope :recent, -> { where("date > ?", DEFAULT_RECENTLY.ago) }

  has_many :dishes_food_journals
  has_many :dishes, through: :dishes_food_journals
end
