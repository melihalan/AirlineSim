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

ActiveRecord::Schema.define(version: 2019_01_13_132534) do

  create_table "aircraft_leasings", force: :cascade do |t|
    t.string "name"
    t.integer "tier"
    t.float "discount_factor"
    t.integer "lease_time"
    t.float "month_rate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "amenities", force: :cascade do |t|
    t.integer "flight_id"
    t.string "category"
    t.string "sub_category"
    t.integer "ppp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_amenities_on_flight_id"
  end

  create_table "asset_sales", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["book_id"], name: "index_asset_sales_on_book_id"
    t.index ["turn_id"], name: "index_asset_sales_on_turn_id"
  end

  create_table "assets", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_assets_on_book_id"
    t.index ["turn_id"], name: "index_assets_on_turn_id"
  end

  create_table "banks", force: :cascade do |t|
    t.string "name"
    t.integer "tier"
    t.float "interest_rate_loan"
    t.integer "max_limit_loan"
    t.integer "payback_time"
    t.float "interest_rate_loc"
    t.integer "max_limit_loc"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "balance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.float "latitude"
    t.float "longtitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "slots"
    t.integer "landing_cost"
    t.integer "boarding_cost"
    t.integer "space_rent"
    t.integer "population"
    t.integer "country_id"
    t.integer "hub_opening_cost"
    t.integer "accomadation_cost"
    t.integer "available_slots"
    t.index ["country_id"], name: "index_cities_on_country_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.integer "territory_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["territory_id"], name: "index_countries_on_territory_id"
  end

  create_table "credit_books", force: :cascade do |t|
    t.integer "bank_id"
    t.integer "user_id"
    t.string "product"
    t.integer "balance"
    t.integer "payback_term"
    t.integer "interest"
    t.datetime "turn"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bank_id"], name: "index_credit_books_on_bank_id"
    t.index ["user_id"], name: "index_credit_books_on_user_id"
  end

  create_table "demands", force: :cascade do |t|
    t.integer "em"
    t.integer "lm"
    t.integer "nn"
    t.integer "an"
    t.integer "eg"
    t.integer "le"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "day"
  end

  create_table "flights", force: :cascade do |t|
    t.integer "xroute_id"
    t.integer "schedule_id"
    t.datetime "departure"
    t.integer "duration"
    t.integer "air_tax"
    t.integer "fuel_cost"
    t.string "flight_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "arrival"
    t.index ["schedule_id"], name: "index_flights_on_schedule_id"
    t.index ["xroute_id"], name: "index_flights_on_xroute_id"
  end

  create_table "hubs", force: :cascade do |t|
    t.integer "city_id"
    t.integer "rental_cost"
    t.integer "office_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "slots"
    t.index ["city_id"], name: "index_hubs_on_city_id"
    t.index ["user_id"], name: "index_hubs_on_user_id"
  end

  create_table "investments", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["book_id"], name: "index_investments_on_book_id"
    t.index ["turn_id"], name: "index_investments_on_turn_id"
  end

  create_table "liabilities", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_liabilities_on_book_id"
    t.index ["turn_id"], name: "index_liabilities_on_turn_id"
  end

  create_table "order_books", force: :cascade do |t|
    t.integer "aircraft_leasing_id"
    t.integer "user_id"
    t.integer "plane_model_family_id"
    t.integer "plane_model_id"
    t.integer "que_number"
    t.datetime "delivery_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["aircraft_leasing_id"], name: "index_order_books_on_aircraft_leasing_id"
    t.index ["plane_model_family_id"], name: "index_order_books_on_plane_model_family_id"
    t.index ["plane_model_id"], name: "index_order_books_on_plane_model_id"
    t.index ["user_id"], name: "index_order_books_on_user_id"
  end

  create_table "plane_manufacturers", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "airbus_320"
    t.float "airbus_330"
    t.float "airbus_350"
    t.float "airbus_380"
    t.float "boeing_737"
    t.float "boeing_747"
    t.float "boeing_777"
    t.float "boeing_787"
  end

  create_table "plane_model_families", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plane_manufacturer_id"
    t.index ["plane_manufacturer_id"], name: "index_plane_model_families_on_plane_manufacturer_id"
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
    t.string "size"
    t.integer "counter"
    t.integer "plane_model_family_id"
    t.integer "plane_manufacturer_id"
    t.index ["plane_manufacturer_id"], name: "index_plane_models_on_plane_manufacturer_id"
    t.index ["plane_model_family_id"], name: "index_plane_models_on_plane_model_family_id"
  end

  create_table "planes", force: :cascade do |t|
    t.integer "plane_model_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.integer "location"
    t.integer "seat_configuration"
    t.index ["plane_model_id"], name: "index_planes_on_plane_model_id"
    t.index ["user_id"], name: "index_planes_on_user_id"
  end

  create_table "revenues", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["book_id"], name: "index_revenues_on_book_id"
    t.index ["turn_id"], name: "index_revenues_on_turn_id"
  end

  create_table "running_costs", force: :cascade do |t|
    t.integer "book_id"
    t.integer "turn_id"
    t.string "category"
    t.integer "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "description"
    t.index ["book_id"], name: "index_running_costs_on_book_id"
    t.index ["turn_id"], name: "index_running_costs_on_turn_id"
  end

  create_table "schedules", force: :cascade do |t|
    t.integer "plane_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.index ["plane_id"], name: "index_schedules_on_plane_id"
  end

  create_table "seat_configurations", force: :cascade do |t|
    t.integer "first_class"
    t.integer "business_class"
    t.integer "economy_class"
    t.integer "passenger"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "plane_model_id"
    t.index ["plane_model_id"], name: "index_seat_configurations_on_plane_model_id"
  end

  create_table "slots_allocations", force: :cascade do |t|
    t.integer "city_id"
    t.integer "user_id"
    t.integer "slots"
    t.integer "used_slots"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_slots_allocations_on_city_id"
    t.index ["user_id"], name: "index_slots_allocations_on_user_id"
  end

  create_table "staff_names", force: :cascade do |t|
    t.string "name"
    t.string "surname"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "staffs", force: :cascade do |t|
    t.integer "hub_id"
    t.integer "plane_id"
    t.string "job"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.integer "user_id"
    t.integer "runtime"
    t.integer "location"
    t.index ["hub_id"], name: "index_staffs_on_hub_id"
    t.index ["plane_id"], name: "index_staffs_on_plane_id"
    t.index ["user_id"], name: "index_staffs_on_user_id"
  end

  create_table "territories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.integer "flight_id"
    t.integer "base_cost"
    t.integer "price"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ppp_first"
    t.integer "ppp_business"
    t.integer "ppp_economy"
    t.index ["flight_id"], name: "index_tickets_on_flight_id"
  end

  create_table "turns", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "term"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "airline_name"
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "xroutes", force: :cascade do |t|
    t.integer "distance"
    t.integer "max_num_pas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "origin"
    t.integer "destination"
    t.integer "ecd"
    t.integer "bcd"
    t.integer "fcd"
  end

end
