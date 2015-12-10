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

ActiveRecord::Schema.define(version: 20151209184522) do

  create_table "lists", force: true do |t|
    t.string   "name",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "microposts", force: true do |t|
    t.text     "content"
    t.string   "usuario"
    t.string   "id_twitter"
    t.integer  "list_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["list_id", "created_at"], name: "index_microposts_on_list_id_and_created_at"
  add_index "microposts", ["list_id"], name: "index_microposts_on_list_id"

  create_table "tweets", force: true do |t|
    t.string   "user"
    t.string   "content"
    t.string   "id_str"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
