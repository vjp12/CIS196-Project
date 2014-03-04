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

ActiveRecord::Schema.define(version: 20140303020635) do

  create_table "investments", force: true do |t|
    t.integer  "member_id"
    t.integer  "stock_id"
    t.decimal  "share_change"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "investments", ["member_id"], name: "index_investments_on_member_id"
  add_index "investments", ["stock_id"], name: "index_investments_on_stock_id"

  create_table "members", force: true do |t|
    t.string   "name"
    t.decimal  "funds"
    t.integer  "active_investments"
    t.decimal  "value"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
  end

  add_index "members", ["email"], name: "index_members_on_email", unique: true
  add_index "members", ["reset_password_token"], name: "index_members_on_reset_password_token", unique: true

  create_table "models", force: true do |t|
    t.string   "Companies"
    t.string   "name"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.string   "body"
    t.string   "text"
    t.integer  "stock_id"
    t.integer  "member_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "posts", ["member_id"], name: "index_posts_on_member_id"
  add_index "posts", ["stock_id"], name: "index_posts_on_stock_id"

  create_table "stocks", force: true do |t|
    t.string   "name"
    t.decimal  "price"
    t.decimal  "market_value"
    t.integer  "investors"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
