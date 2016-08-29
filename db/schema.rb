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

ActiveRecord::Schema.define(version: 20160829095335) do

  create_table "attendances", force: :cascade do |t|
    t.integer  "schedule_id"
    t.integer  "user_id"
    t.integer  "status"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "b_nums", force: :cascade do |t|
    t.integer  "count"
    t.integer  "st"
    t.integer  "et"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "borrows", force: :cascade do |t|
    t.text     "content"
    t.integer  "weight"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "post_replies", force: :cascade do |t|
    t.text     "content"
    t.integer  "post_id"
    t.integer  "team_id"
    t.text     "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "posts", force: :cascade do |t|
    t.text     "tag",        default: ""
    t.text     "name"
    t.text     "content"
    t.integer  "user_id"
    t.integer  "team_id"
    t.text     "time"
    t.string   "image_url",  default: ""
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "schedules", force: :cascade do |t|
    t.string   "name"
    t.string   "position"
    t.date     "date"
    t.text     "time"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string   "name"
    t.text     "intro_text"
    t.text     "team_img",   default: "team_default.jpg"
    t.integer  "school_id"
    t.text     "deadline"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "user_teams", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.integer  "power",      default: 1
    t.integer  "count",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "userpics", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "profile_img"
    t.boolean  "main",        default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "username"
    t.integer  "s_num"
    t.integer  "gender"
    t.string   "p_num"
    t.integer  "level",                  default: 1
    t.boolean  "img_poa",                default: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
