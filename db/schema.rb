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

ActiveRecord::Schema[7.0].define(version: 2023_08_17_145524) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "starts_on"
    t.date "ends_on"
    t.bigint "property_id", null: false
    t.bigint "external_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "reserve_keys"
    t.float "reserve_price"
    t.index ["property_id"], name: "index_availabilities_on_property_id"
  end

  create_table "properties", force: :cascade do |t|
    t.bigint "external_id"
    t.string "name"
    t.string "primary_photo_url"
    t.string "city"
    t.string "country_code"
    t.string "state"
    t.float "lat"
    t.float "lng"
    t.jsonb "amenities", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.jsonb "photos", default: [], array: true
    t.string "property_style"
    t.string "property_type"
    t.integer "max_occupancy"
    t.integer "square_feet"
    t.text "description"
    t.string "view_from_property"
    t.string "nearest_airport"
    t.string "distance_from_airtport"
    t.integer "bedrooms_count"
    t.jsonb "activities"
    t.jsonb "interest_places"
    t.jsonb "interest_activities"
    t.jsonb "reviews"
  end

  create_table "user_property_scores", force: :cascade do |t|
    t.float "score", default: 0.0, null: false
    t.bigint "user_id", null: false
    t.bigint "property_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["property_id"], name: "index_user_property_scores_on_property_id"
    t.index ["user_id"], name: "index_user_property_scores_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "city"
    t.string "state"
    t.string "country_code"
    t.jsonb "interests", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "availabilities", "properties"
  add_foreign_key "user_property_scores", "properties"
  add_foreign_key "user_property_scores", "users"
end
