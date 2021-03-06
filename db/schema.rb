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

ActiveRecord::Schema.define(version: 20150805183954) do

  create_table "expenses", force: true do |t|
    t.decimal  "amount"
    t.integer  "master_expense_id"
    t.string   "notes"
    t.integer  "goal_id"
    t.integer  "one_time"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "expenses", ["user_id"], name: "index_expenses_on_user_id"

  create_table "goals", force: true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.date     "complete_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.decimal  "weekly_contribution"
  end

  add_index "goals", ["user_id"], name: "index_goals_on_user_id"

  create_table "master_expenses", force: true do |t|
    t.decimal  "amount"
    t.string   "category"
    t.integer  "mandatory"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  add_index "master_expenses", ["user_id"], name: "index_master_expenses_on_user_id"

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
