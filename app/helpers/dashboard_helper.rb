module DashboardHelper
  DEFAULT_IGNORED_FAMILIES = %w(fruits)

  def food_journal_pie(days)
    chartify(FoodJournal.where('date > ?', days.ago).joins(:dishes).group('dishes.family').count)
  end

  def outlet_order_pie(days)
    chartify(FoodJournal.where('date > ?', days.ago).joins(dishes: :outlet).group('outlets.name').count)
  end

  def outlet_sorted_last_ordered
    Outlet.order("last_ordered_at DESC NULLS LAST").select(:name, :last_ordered_at)
  end

  def dishes_never_made(outlet_name: nil)
    query = Dish.left_outer_joins(:dishes_food_journals).where(dishes_food_journals: { dish_id: nil })
    query = query.joins(:outlet).where("outlets.name": outlet_name) if outlet_name

    query.select("dishes.name, dishes.family")
  end

  def suggested_dishes(except_families: nil)
    families_to_ignore = FoodJournal.recent.joins(:dishes).pluck('distinct(dishes.family)') + DEFAULT_IGNORED_FAMILIES
    families_to_ignore += Array.wrap(except_families) if except_families

    Dish.where.not(family: families_to_ignore)
  end

  def future_dishes
    dish_dates = FoodJournal.recent.joins(:dishes).group('dishes.family').order(1).maximum('food_journals.date').
      select { |k, v| v < 3.days.ago }
    dish_dates.map do |k, v|
      [Dish::formatted_family(k), (v + FoodJournal::DEFAULT_RECENCY).strftime(ApplicationHelper::INDIA_DATE_FORMAT)]
    end
  end

  private def chartify(data)
    data.each_with_object([]) do |(k, v), arr|
      arr << { name: k, y: v}
    end
  end
end
