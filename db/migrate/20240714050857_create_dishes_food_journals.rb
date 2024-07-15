class CreateDishesFoodJournals < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes_food_journals do |t|
      t.references :dish, null: false, foreign_key: true
      t.references :food_journal, null: false, foreign_key: true
      t.decimal :quantity

      t.timestamps
    end
  end
end
