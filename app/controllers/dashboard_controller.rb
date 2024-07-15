class DashboardController < ApplicationController
  def index
    @dishes = Dish.all
    @food_journal = FoodJournal.recent.includes(:dishes)
  end
end
