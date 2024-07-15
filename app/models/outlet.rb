class Outlet < ApplicationRecord
  validates :name, :location, presence: true
end
