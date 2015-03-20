# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150320004701) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.string   "abbreviation"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  create_table "cycles", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "length_of_time"
    t.string   "length_of_time_units"
    t.string   "description"
    t.date     "start_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exercises", force: :cascade do |t|
    t.string   "name"
    t.string   "nickname"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "subcategory_id"
  end

  create_table "subcategories", force: :cascade do |t|
    t.string   "name"
    t.integer  "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.string   "time_zone"
    t.string   "location"
    t.string   "slug"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "role"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.string   "slug"
  end

  create_table "workout_exercises", force: :cascade do |t|
    t.integer  "workout_id"
    t.integer  "exercise_id"
    t.string   "order"
    t.string   "quick_note"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "workout_sets", force: :cascade do |t|
    t.integer  "workout_exercise_id"
    t.integer  "weight_or_duration"
    t.integer  "amount"
    t.integer  "relative_perceived_exertion"
    t.string   "work_units"
    t.string   "amount_units"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "completion"
  end

  create_table "workouts", force: :cascade do |t|
    t.integer  "cycle_id"
    t.string   "am_pm"
    t.date     "date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
