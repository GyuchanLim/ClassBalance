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

ActiveRecord::Schema[8.0].define(version: 2025_01_06_044931) do
  create_table "appointments", force: :cascade do |t|
    t.datetime "datetime"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "appointments_clients", id: false, force: :cascade do |t|
    t.integer "appointment_id"
    t.integer "client_id"
    t.index ["appointment_id"], name: "index_appointments_clients_on_appointment_id"
    t.index ["client_id"], name: "index_appointments_clients_on_client_id"
  end

  create_table "clients", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "email"
    t.string "phone_number"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
end
