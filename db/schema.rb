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

ActiveRecord::Schema.define(version: 30) do

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
    t.string "created_by", limit: 50
    t.string "updated_by", limit: 50
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["reset_password_token"], name: "index_candidates_on_reset_password_token", unique: true
    t.index ["username"], name: "index_candidates_on_username", unique: true
  end

  create_table "exams", force: :cascade do |t|
    t.bigint "owner_id", null: false
    t.string "title", limit: 50, null: false
    t.string "description", limit: 500
    t.string "format", limit: 30
    t.integer "fee", null: false
    t.integer "max_enrollment", null: false
    t.string "status", limit: 50, null: false
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

  add_foreign_key "exams", "organizations", column: "owner_id"
end
