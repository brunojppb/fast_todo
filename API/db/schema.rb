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

ActiveRecord::Schema.define(version: 20151222030703) do

  create_table "devices", force: :cascade do |t|
    t.string   "auth_token",       default: "",    null: false
    t.string   "operation_system", default: "",    null: false
    t.boolean  "active",           default: false, null: false
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "devices", ["auth_token"], name: "index_devices_on_auth_token", unique: true
  add_index "devices", ["user_id"], name: "index_devices_on_user_id"

  create_table "todos", force: :cascade do |t|
    t.string   "title",      default: ""
    t.string   "body",       default: ""
    t.datetime "due_date"
    t.boolean  "completed",  default: false
    t.boolean  "remember",   default: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name",      default: "",    null: false
    t.string   "last_name",       default: "",    null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "is_active",       default: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
