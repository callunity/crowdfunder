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

ActiveRecord::Schema.define(version: 20140923181152) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "customers", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_types", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "food_types_restaurants", id: false, force: true do |t|
    t.integer "restaurant_id", null: false
    t.integer "food_type_id",  null: false
  end

  create_table "galleries", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment"
  end

  create_table "projects", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "goal"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reservations", force: true do |t|
    t.integer  "customer_id"
    t.integer  "restaurant_id"
    t.integer  "party_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "end_date_time"
    t.datetime "start_date_time"
  end

  add_index "reservations", ["customer_id"], name: "index_reservations_on_customer_id", using: :btree
  add_index "reservations", ["restaurant_id"], name: "index_reservations_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "capacity"
    t.string   "address"
    t.string   "city"
    t.string   "province"
    t.string   "postal_code"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "description"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "area_code"
    t.string   "phone_prefix"
    t.string   "phone_suffix"
  end

  create_table "reviews", force: true do |t|
    t.text     "comment"
    t.integer  "restaurant_id"
    t.integer  "customer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
