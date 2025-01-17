class Dish < ApplicationRecord
  belongs_to :outlet

  enum family: {
    daal: 0,
    chhole_rajma: 1,
    rice: 2,
    aloo: 3,
    matar: 4,
    paneer_tofu: 5,
    maida: 6,
    green: 7,
    pakoda_kofta: 8,
    sooji: 9,
    parantha: 10,
    bread: 11,
    fruits: 12,
    maida: 13,
    healthy: 14,
    nonveg: 15,
    snacks_outside: 16,
  }

  enum season: {
    'N/A': 0,
    summer: 1,
    winter: 2,
  }

  has_many :dishes_food_journals
  has_many :food_journals, through: :dishes_food_journals

  validates_presence_of :name, :family

  def view_name
    "#{name} [#{outlet.name}]"
  end

  def formatted_family
    self.class.formatted_family(family)
  end

  def self.formatted_family(family)
    family.split('_').map { |x| x.capitalize }.join(" or ")
  end
end
