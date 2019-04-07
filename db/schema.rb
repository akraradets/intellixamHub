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

ActiveRecord::Schema.define(version: 60) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admins", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "encrypted_password", limit: 100, null: false
    t.string "employee_id", limit: 30, null: false
    t.string "email", limit: 100, null: false
    t.string "firstname", limit: 50, null: false
    t.string "lastname", limit: 50, null: false
    t.string "phone_no", limit: 20, null: false
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admins_on_email", unique: true
    t.index ["employee_id"], name: "index_admins_on_employee_id", unique: true
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
    t.index ["username"], name: "index_admins_on_username", unique: true
  end

  create_table "buildings", force: :cascade do |t|
    t.string "name", limit: 50
    t.string "address", limit: 200
    t.decimal "latitude", precision: 9, scale: 6
    t.decimal "longitude", precision: 9, scale: 6
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "candidates", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "encrypted_password", limit: 100, null: false
    t.string "firstname", limit: 50, null: false
    t.string "lastname", limit: 50, null: false
    t.string "phone_no", limit: 20
    t.string "gender", limit: 1, null: false
    t.date "birthday", null: false
    t.string "address", limit: 200
    t.string "email", limit: 100, null: false
    t.string "citizen_id", limit: 30, null: false
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["citizen_id"], name: "index_candidates_on_citizen_id", unique: true
    t.index ["email"], name: "index_candidates_on_email", unique: true
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
    t.index ["username"], name: "index_candidates_on_username", unique: true
  end

  create_table "enrollments", force: :cascade do |t|
    t.bigint "exam_id"
    t.bigint "candidate_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_enrollments_on_candidate_id"
    t.index ["exam_id"], name: "index_enrollments_on_exam_id"
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "title", limit: 50
    t.string "description", limit: 500
    t.string "format", limit: 30
    t.integer "fee"
    t.integer "max_enrollment"
    t.string "status", limit: 50
    t.datetime "start_time"
    t.datetime "end_time"
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["owner_id"], name: "index_exams_on_owner_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "username", limit: 50, null: false
    t.string "encrypted_password", limit: 100, null: false
    t.string "name", limit: 100, null: false
    t.string "tax_id", limit: 30, null: false
    t.string "address", limit: 200
    t.string "contact_name", limit: 100
    t.string "phone_no", limit: 20
    t.string "email", limit: 100, null: false
    t.string "contact_note", limit: 500
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_organizations_on_email", unique: true
    t.index ["reset_password_token"], name: "index_organizations_on_reset_password_token", unique: true
    t.index ["tax_id"], name: "index_organizations_on_tax_id", unique: true
    t.index ["username"], name: "index_organizations_on_username", unique: true
  end

  create_table "reservations", force: :cascade do |t|
    t.bigint "exam_id"
    t.bigint "room_id"
    t.string "created_by", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["exam_id"], name: "index_reservations_on_exam_id"
    t.index ["room_id"], name: "index_reservations_on_room_id"
  end

  create_table "rooms", force: :cascade do |t|
    t.bigint "building_id"
    t.string "name", limit: 50
    t.string "floor", limit: 3
    t.integer "max_row"
    t.integer "max_column"
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_rooms_on_building_id"
  end

  create_table "seats", force: :cascade do |t|
    t.bigint "reservation_id"
    t.bigint "enrollment_id"
    t.bigint "candidate_id"
    t.bigint "room_id"
    t.string "name", limit: 50
    t.integer "row"
    t.integer "column"
    t.boolean "is_extra"
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_seats_on_candidate_id"
    t.index ["enrollment_id"], name: "index_seats_on_enrollment_id"
    t.index ["reservation_id"], name: "index_seats_on_reservation_id"
    t.index ["room_id"], name: "index_seats_on_room_id"
  end

  add_foreign_key "enrollments", "candidates"
  add_foreign_key "enrollments", "exams"
  add_foreign_key "exams", "organizations", column: "owner_id"
  add_foreign_key "reservations", "exams"
  add_foreign_key "reservations", "rooms"
  add_foreign_key "rooms", "buildings"
  add_foreign_key "seats", "candidates"
  add_foreign_key "seats", "enrollments"
  add_foreign_key "seats", "reservations"
  add_foreign_key "seats", "rooms"
end
