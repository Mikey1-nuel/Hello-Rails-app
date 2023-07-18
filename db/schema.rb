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

ActiveRecord::Schema[7.0].define(version: 0) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animals", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.date "date_of_birth", null: false
    t.integer "escape_attempts", null: false
    t.boolean "neutered", null: false
    t.decimal "weight_kg", null: false
    t.integer "species_id"
    t.integer "owner_id"
  end

  create_table "owners", id: :integer, default: nil, force: :cascade do |t|
    t.integer "owner_id", null: false
    t.string "full_name", limit: 100, null: false
    t.integer "age", null: false
    t.string "email", limit: 120
  end

  create_table "specializations", primary_key: ["specie_id", "vet_id"], force: :cascade do |t|
    t.integer "specie_id", null: false
    t.integer "vet_id", null: false
  end

  create_table "species", id: :integer, default: nil, force: :cascade do |t|
    t.integer "species_id", null: false
    t.string "name", limit: 100, null: false
  end

  create_table "vets", id: :integer, default: nil, force: :cascade do |t|
    t.string "name", limit: 100, null: false
    t.integer "age", null: false
    t.date "date_of_graduation", null: false
  end

  create_table "visits", id: :integer, default: nil, force: :cascade do |t|
    t.integer "animal_id"
    t.integer "vet_id"
    t.date "date_of_visit", null: false
  end

  add_foreign_key "owners", "animals", column: "owner_id", name: "fk_owners", on_delete: :nullify
  add_foreign_key "specializations", "species", column: "specie_id", name: "specializations_specie_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "specializations", "vets", name: "specializations_vet_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "species", "animals", column: "species_id", name: "fk_species", on_delete: :nullify
  add_foreign_key "visits", "animals", name: "visits_animal_id_fkey", on_update: :cascade, on_delete: :cascade
  add_foreign_key "visits", "vets", name: "visits_vet_id_fkey", on_update: :cascade, on_delete: :cascade
end
