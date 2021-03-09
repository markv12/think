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

ActiveRecord::Schema.define(version: 20181219061228) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assessments_users", id: false, force: :cascade do |t|
    t.integer "assessment_id"
    t.integer "user_id"
  end

  create_table "categories", id: :serial, force: :cascade do |t|
    t.text "name"
    t.text "abbreviation"
    t.text "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "categories_habits", id: false, force: :cascade do |t|
    t.integer "habit_id"
    t.integer "category_id"
  end

  create_table "categories_questions", id: false, force: :cascade do |t|
    t.integer "category_id"
    t.integer "question_id"
  end

  create_table "entries", id: :serial, force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text "text"
    t.integer "user_id"
    t.integer "wordcount", default: 0
  end

  create_table "user_sessions", id: :serial, force: :cascade do |t|
    t.string "session_id", limit: 255, null: false
    t.text "data"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["session_id"], name: "index_user_sessions_on_session_id"
    t.index ["updated_at"], name: "index_user_sessions_on_updated_at"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.string "name", limit: 255, default: "", null: false
    t.string "crypted_password", limit: 255, null: false
    t.string "password_salt", limit: 255, null: false
    t.string "email", limit: 255, null: false
    t.string "persistence_token", limit: 255, null: false
    t.string "single_access_token", limit: 255, null: false
    t.string "perishable_token", limit: 255, null: false
    t.integer "login_count", default: 0, null: false
    t.integer "failed_login_count", default: 0, null: false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string "current_login_ip", limit: 255
    t.string "last_login_ip", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer "daily_assessment_id"
    t.boolean "admin", default: false
  end

end
