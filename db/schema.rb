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

ActiveRecord::Schema[7.0].define(version: 2022_10_29_164245) do
  create_table "dishes", force: :cascade do |t|
    t.string "name"
    t.integer "number_of_reviews"
    t.float "price"
    t.integer "category"
    t.float "avg_rating"
    t.string "imgs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "restaurant_id"
    t.string "ingredients"
    t.string "description"
    t.index ["restaurant_id"], name: "index_dishes_on_restaurant_id"
  end

  create_table "homepages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reports", force: :cascade do |t|
    t.integer "check_box"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "restaurants", force: :cascade do |t|
    t.string "name"
    t.string "username"
    t.string "website"
    t.string "description"
    t.string "profile_picture"
    t.string "telephone_number"
    t.string "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_restaurants_on_email", unique: true
    t.index ["reset_password_token"], name: "index_restaurants_on_reset_password_token", unique: true
  end

  create_table "reviewers", force: :cascade do |t|
    t.string "username"
    t.string "profile_picture"
    t.string "telephone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_reviewers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_reviewers_on_reset_password_token", unique: true
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating1"
    t.integer "rating2"
    t.integer "rating3"
    t.string "description"
    t.string "imgs"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dish_id", null: false
    t.integer "reviewer_id", null: false
    t.index ["dish_id"], name: "index_reviews_on_dish_id"
    t.index ["reviewer_id"], name: "index_reviews_on_reviewer_id"
  end

  add_foreign_key "reviews", "dishes"
  add_foreign_key "reviews", "reviewers"
end
