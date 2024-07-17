module DashboardHelper
  def food_journal_pie(days)
    chartify(FoodJournal.where('date > ?', days.ago).joins(:dishes).group('dishes.family').count)
  end

  def outlet_order_pie(days)
    chartify(FoodJournal.where('date > ?', days.ago).joins(dishes: :outlet).group('outlets.name').count)
  end

  def outlet_sorted_last_ordered
    Outlet.order("last_ordered_at DESC NULLS LAST").select(:name, :last_ordered_at)
  end

  private def chartify(data)
    data.each_with_object([]) do |(k, v), arr|
      arr << { name: k, y: v}
    end
  end
end
