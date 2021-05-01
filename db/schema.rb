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

ActiveRecord::Schema.define(version: 2021_05_01_013239) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cabals", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invitation_token"
    t.index ["invitation_token"], name: "index_cabals_on_invitation_token", unique: true
  end

  create_table "celebrations", force: :cascade do |t|
    t.string "name"
    t.string "occasion"
    t.string "theme"
    t.string "colors"
    t.string "signature_drink"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "activity"
    t.string "status", default: "Planning"
    t.integer "cabal_id"
    t.integer "user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.text "body"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "celebration_id"
    t.integer "parent_id"
  end

  create_table "guests", force: :cascade do |t|
    t.integer "user_id"
    t.integer "celebration_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "members", force: :cascade do |t|
    t.integer "user_id"
    t.integer "cabal_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "moodboards", force: :cascade do |t|
    t.integer "photo_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id"
    t.integer "celebration_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "src_id"
    t.string "color"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "password_digest"
    t.string "image"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "invite_token"
    t.string "quote"
  end

end
