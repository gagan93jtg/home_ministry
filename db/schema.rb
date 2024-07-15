# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_07_14_050857) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "family"
    t.integer "season"
    t.bigint "outlet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["outlet_id"], name: "index_dishes_on_outlet_id"
  end

  create_table "dishes_food_journals", force: :cascade do |t|
    t.bigint "dish_id", null: false
    t.bigint "food_journal_id", null: false
    t.decimal "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dish_id"], name: "index_dishes_food_journals_on_dish_id"
    t.index ["food_journal_id"], name: "index_dishes_food_journals_on_food_journal_id"
  end

  create_table "food_journals", force: :cascade do |t|
    t.date "date"
    t.integer "time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "outlets", force: :cascade do |t|
    t.string "name"
    t.string "location"
    t.datetime "last_ordered_at", precision: nil
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "dishes", "outlets"
  add_foreign_key "dishes_food_journals", "dishes"
  add_foreign_key "dishes_food_journals", "food_journals"
end
