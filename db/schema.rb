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

ActiveRecord::Schema.define(version: 2018_11_20_155053) do

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longtitude"
    t.integer "population"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hubs", force: :cascade do |t|
    t.integer "city_id"
    t.integer "opening_cost"
    t.integer "rental_cost"
    t.integer "office_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_hubs_on_city_id"
  end

  create_table "plane_models", force: :cascade do |t|
    t.string "name"
    t.integer "range"
    t.integer "avg_speed"
    t.integer "max_pas"
    t.integer "fuel_use"
    t.integer "cost"
    t.integer "maintanence"
    t.integer "pilots"
    t.integer "hosts"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "planes", force: :cascade do |t|
    t.integer "plane_model_id"
    t.integer "xroute_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plane_model_id"], name: "index_planes_on_plane_model_id"
    t.index ["xroute_id"], name: "index_planes_on_xroute_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "plane_id"
    t.integer "xroute_id"
    t.integer "duration"
    t.integer "td1"
    t.integer "ta1"
    t.integer "td2"
    t.integer "ta2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["plane_id"], name: "index_schedules_on_plane_id"
    t.index ["xroute_id"], name: "index_schedules_on_xroute_id"
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "hub_id"
    t.integer "plane_id"
    t.string "job"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.index ["hub_id"], name: "index_staffs_on_hub_id"
    t.index ["plane_id"], name: "index_staffs_on_plane_id"
  end

  create_table "xroutes", force: :cascade do |t|
    t.integer "hub_id"
    t.integer "city_id"
    t.integer "distance"
    t.integer "max_num_pas"
    t.integer "operating_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_xroutes_on_city_id"
    t.index ["hub_id"], name: "index_xroutes_on_hub_id"
  end

end
