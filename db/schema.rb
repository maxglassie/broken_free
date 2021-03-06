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

ActiveRecord::Schema.define(version: 20170417215807) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.string   "code"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "region_id"
    t.string   "income_group"
    t.string   "two_code"
    t.index ["region_id"], name: "index_countries_on_region_id", using: :btree
  end

  create_table "indicators", force: :cascade do |t|
    t.float    "economic_freedom_index"
    t.float    "corruption_perception_index"
    t.integer  "country_id"
    t.integer  "year_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.index ["country_id"], name: "index_indicators_on_country_id", using: :btree
    t.index ["year_id"], name: "index_indicators_on_year_id", using: :btree
  end

  create_table "regions", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "years", force: :cascade do |t|
    t.string   "year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "countries", "regions"
  add_foreign_key "indicators", "countries"
  add_foreign_key "indicators", "years"
end
