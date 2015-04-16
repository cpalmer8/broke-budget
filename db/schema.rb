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

ActiveRecord::Schema.define(version: 20150416230915) do

  create_table "actual_expenses", force: true do |t|
    t.integer  "amount"
    t.integer  "masterexpenses_id"
    t.string   "notes"
    t.integer  "goal_id"
    t.integer  "one_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "expenses", force: true do |t|
    t.decimal  "amount"
    t.integer  "masterexpenses_id"
    t.string   "notes"
    t.integer  "goal_id"
    t.integer  "one_time"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "goals", force: true do |t|
    t.string   "name"
    t.decimal  "amount"
    t.date     "complete_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "master_expenses", force: true do |t|
    t.decimal  "amount"
    t.string   "category"
    t.integer  "mandatory"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end