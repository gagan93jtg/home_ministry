class FoodJournal < ApplicationRecord
  DEFAULT_RECENTLY = 10.days

  enum time: {
    breakfast: 0,
    lunch: 1,
    evening: 2,
    dinner: 3,
  }

  scope :recent, -> { where("date > ?", DEFAULT_RECENTLY.ago) }

  has_many :dishes_food_journals, dependent: :destroy
  has_many :dishes, through: :dishes_food_journals

  validates_uniqueness_of :date, scope: [:time], message: "One entry per time"
end
