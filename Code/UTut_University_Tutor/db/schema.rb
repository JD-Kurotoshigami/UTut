# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180514084406) do

  create_table "requests", force: :cascade do |t|
    t.integer "tut_id"
    t.integer "tutor_id"
    t.integer "tutee_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "status"
    t.index ["tut_id"], name: "index_requests_on_tut_id"
    t.index ["tutee_id"], name: "index_requests_on_tutee_id"
    t.index ["tutor_id"], name: "index_requests_on_tutor_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.string "body"
    t.integer "rating"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reviewer_id"
    t.string "subject"
    t.index ["user_id"], name: "index_reviews_on_user_id"
  end

  create_table "timeslots", force: :cascade do |t|
    t.integer "start_hr"
    t.integer "start_min"
    t.integer "end_hr"
    t.integer "end_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.integer "tutor_id"
    t.integer "tutee_id"
    t.string "subject"
    t.string "day"
    t.integer "start_hr"
    t.integer "start_min"
    t.integer "end_hr"
    t.integer "end_min"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "done"
    t.integer "reviewed"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "firstname"
    t.string "lastname"
    t.string "sex"
    t.string "description"
    t.string "password_digest"
    t.index ["firstname"], name: "index_users_on_firstname"
    t.index ["lastname"], name: "index_users_on_lastname"
    t.index ["username"], name: "index_users_on_username", unique: true
  end

end
