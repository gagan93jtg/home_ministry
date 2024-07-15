class CreateDishes < ActiveRecord::Migration[7.1]
  def change
    create_table :dishes do |t|
      t.string :name
      t.integer :family
      t.integer :season
      t.references :outlet, foreign_key: true

      t.timestamps
    end
  end
end
