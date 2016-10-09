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

ActiveRecord::Schema.define(version: 20161009080952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "areas", force: :cascade do |t|
    t.string   "name"
    t.boolean  "open_at_all_times", default: true
    t.string   "open_times"
    t.text     "prohibited"
    t.text     "description"
    t.text     "image",             default: [],                array: true
    t.string   "address"
    t.float    "latitude"
    t.float    "longitude"
    t.text     "info_link"
    t.boolean  "official",          default: true
    t.string   "size"
    t.integer  "user_id"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "areas_facilities", force: :cascade do |t|
    t.integer "area_id"
    t.integer "facility_id"
  end

  create_table "areas_terrains", force: :cascade do |t|
    t.integer "area_id"
    t.integer "terrain_id"
  end

  create_table "facilities", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.integer  "score"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "area_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "terrains", force: :cascade do |t|
    t.string   "name"
    t.string   "icon"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.string   "user_name"
    t.string   "email"
    t.text     "password_digest"
    t.boolean  "admin",            default: false
    t.text     "image"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

end
