module FoodJournalsHelper
  def food_journal_time_icon(food_journal)
    if food_journal.breakfast?
     "fa-mug-hot"
    elsif food_journal.lunch?
     "fa-bowl-rice"
    elsif food_journal.evening?
     "fa-pizza-slice"
    elsif food_journal.dinner?
      "fa-champagne-glasses"
    end
  end
end
