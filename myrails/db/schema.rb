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

ActiveRecord::Schema[7.0].define(version: 2023_03_26_102351) do
  create_table "clinics", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "name"
    t.integer "clinics_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["clinics_id"], name: "index_departments_on_clinics_id"
  end

  create_table "doctors", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "patronymic"
    t.integer "departments_id"
    t.integer "specialities_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["departments_id"], name: "index_doctors_on_departments_id"
    t.index ["specialities_id"], name: "index_doctors_on_specialities_id"
  end

  create_table "patient_maps", force: :cascade do |t|
    t.integer "year_created"
    t.integer "patients_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patients_id"], name: "index_patient_maps_on_patients_id"
  end

  create_table "patients", force: :cascade do |t|
    t.string "surname"
    t.string "name"
    t.string "patronymic"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specialities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "departments", "clinics", column: "clinics_id"
  add_foreign_key "doctors", "departments", column: "departments_id"
  add_foreign_key "doctors", "specialities", column: "specialities_id"
  add_foreign_key "patient_maps", "patients", column: "patients_id"
end
