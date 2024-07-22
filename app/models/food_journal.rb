class FoodJournal < ApplicationRecord
  DEFAULT_RECENCY = 7.days

  enum time: {
    breakfast: 0,
    lunch: 1,
    evening: 2,
    dinner: 3,
  }

  scope :recent, -> { where("date > ?", DEFAULT_RECENCY.ago.beginning_of_day) }

  has_many :dishes_food_journals, dependent: :destroy
  has_many :dishes, through: :dishes_food_journals

  validates_uniqueness_of :date, scope: [:time], message: "One entry per time"

  after_commit :update_outlet_last_ordered

  private def update_outlet_last_ordered
    dishes.each do |dish|
      dish.outlet.update!(last_ordered_at: date)
    end
  end
end
