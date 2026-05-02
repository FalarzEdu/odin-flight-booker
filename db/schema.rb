# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.1].define(version: 2026_05_02_210454) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "airports", force: :cascade do |t|
    t.bigint "city_id", null: false
    t.string "code", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["city_id"], name: "index_airports_on_city_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.bigint "flight_id", null: false
    t.integer "status", default: 0, null: false
    t.decimal "total_paid", precision: 10, scale: 2, default: "0.0", null: false
    t.datetime "updated_at", null: false
    t.index ["flight_id"], name: "index_bookings_on_flight_id"
  end

  create_table "card_informations", force: :cascade do |t|
    t.boolean "active"
    t.datetime "created_at", null: false
    t.string "number"
    t.string "owner_document"
    t.string "owner_full_name"
    t.datetime "updated_at", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_card_informations_on_user_id"
  end

  create_table "card_payments", force: :cascade do |t|
    t.bigint "card_information_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["card_information_id"], name: "index_card_payments_on_card_information_id"
  end

  create_table "cities", force: :cascade do |t|
    t.string "abbreviation", null: false
    t.string "country", null: false
    t.datetime "created_at", null: false
    t.string "name", null: false
    t.string "state", null: false
    t.datetime "updated_at", null: false
  end

  create_table "flights", force: :cascade do |t|
    t.datetime "arrival_datetime", null: false
    t.integer "capacity", null: false
    t.datetime "created_at", null: false
    t.datetime "departure_datetime", null: false
    t.integer "flight_duration", null: false
    t.decimal "price", precision: 10, scale: 2, null: false
    t.bigint "route_id", null: false
    t.datetime "updated_at", null: false
    t.index ["route_id"], name: "index_flights_on_route_id"
  end

  create_table "passengers", force: :cascade do |t|
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.date "date_of_birth", null: false
    t.string "name", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_passengers_on_booking_id"
  end

  create_table "payments", force: :cascade do |t|
    t.decimal "amount", precision: 10, scale: 2, null: false
    t.datetime "created_at", null: false
    t.bigint "payable_id", null: false
    t.string "payable_type", null: false
    t.integer "status", default: 0, null: false
    t.datetime "updated_at", null: false
    t.index ["payable_type", "payable_id"], name: "index_payments_on_payable"
  end

  create_table "pix_payments", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "expires_at", precision: nil, null: false
    t.string "issuing_bank"
    t.string "payload"
    t.string "pix_key"
    t.string "transaction_id"
    t.datetime "updated_at", null: false
  end

  create_table "routes", force: :cascade do |t|
    t.bigint "arrival_airport_id", null: false
    t.datetime "created_at", null: false
    t.bigint "departure_airport_id", null: false
    t.decimal "distance", precision: 8, scale: 2, null: false
    t.datetime "updated_at", null: false
    t.index ["arrival_airport_id"], name: "index_routes_on_arrival_airport_id"
    t.index ["departure_airport_id"], name: "index_routes_on_departure_airport_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.date "date_of_birth"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "name"
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

  add_foreign_key "airports", "cities"
  add_foreign_key "bookings", "flights"
  add_foreign_key "card_informations", "users"
  add_foreign_key "card_payments", "card_informations"
  add_foreign_key "flights", "routes"
  add_foreign_key "passengers", "bookings"
  add_foreign_key "routes", "airports", column: "arrival_airport_id"
  add_foreign_key "routes", "airports", column: "departure_airport_id"
end
