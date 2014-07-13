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

ActiveRecord::Schema.define(version: 20140713171957) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mines", force: true do |t|
    t.string   "name"
    t.integer  "depth"
    t.integer  "richness"
    t.string   "image"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tools", force: true do |t|
    t.string   "name"
    t.integer  "speed"
    t.integer  "price"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email",           default: "None"
    t.integer  "dollars"
    t.string   "password_digest"
    t.string   "remember_token"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "tool_name",       default: "Pick Axe"
    t.integer  "tool_speed",      default: 1
    t.integer  "tool_id"
  end

  add_index "users", ["tool_id"], name: "index_users_on_tool_id", using: :btree

end
