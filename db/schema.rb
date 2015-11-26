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

ActiveRecord::Schema.define(version: 20151027132318) do

  create_table "work_experiences", force: :cascade do |t|
    t.integer  "worker_id",    limit: 4
    t.string   "company_name", limit: 50,                        null: false
    t.string   "position",     limit: 25,                        null: false
    t.date     "from",                    default: '2015-11-26'
    t.date     "to",                      default: '2015-11-26'
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "workers", force: :cascade do |t|
    t.string   "fullname",        limit: 50
    t.integer  "national_id",     limit: 4,   null: false
    t.string   "email",           limit: 255, null: false
    t.string   "password_digest", limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "workers", ["email"], name: "index_workers_on_email", using: :btree
  add_index "workers", ["national_id"], name: "index_workers_on_national_id", using: :btree

end
