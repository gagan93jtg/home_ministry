class CreateFoodJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :food_journals do |t|
      t.date :date
      t.integer :time

      t.timestamps
    end
  end
end
