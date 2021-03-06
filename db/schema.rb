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

ActiveRecord::Schema.define(version: 20170713085033) do

  create_table "body_stats", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "body_fat"
    t.float    "weight"
    t.float    "height"
    t.float    "waist"
    t.float    "chest"
    t.float    "arms"
    t.float    "forearms"
    t.float    "hips"
    t.float    "neck"
    t.float    "shoulders"
    t.float    "thighs"
    t.float    "calves"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_body_stats_on_user_id"
  end

  create_table "diet_plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "title"
    t.text     "diet_description"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_diet_plans_on_user_id"
  end

  create_table "preferences", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "measure_type"
    t.text     "unit_for_measure"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["user_id"], name: "index_preferences_on_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.datetime "date_of_birth"
    t.string   "address1"
    t.string   "address2"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.text     "init_settings"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
