# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_11_223404) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "achievements", force: :cascade do |t|
    t.bigint "counter_id", null: false
    t.decimal "threshold", null: false
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["counter_id"], name: "index_achievements_on_counter_id"
    t.index ["name"], name: "index_achievements_on_name", unique: true
  end

  create_table "counters", force: :cascade do |t|
    t.string "name", null: false
    t.string "unit"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_counters_on_name", unique: true
  end

  create_table "match_participants", force: :cascade do |t|
    t.bigint "match_id", null: false
    t.bigint "team_id", null: false
    t.integer "score"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["match_id", "team_id"], name: "participate_once", unique: true
    t.index ["match_id"], name: "index_match_participants_on_match_id"
    t.index ["team_id"], name: "index_match_participants_on_team_id"
  end

  create_table "matches", force: :cascade do |t|
    t.string "location", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "player_achievements", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.bigint "achievement_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["achievement_id"], name: "index_player_achievements_on_achievement_id"
    t.index ["match_id"], name: "index_player_achievements_on_match_id"
    t.index ["player_id", "match_id", "achievement_id"], name: "achieve_once", unique: true
    t.index ["player_id"], name: "index_player_achievements_on_player_id"
  end

  create_table "player_counters", force: :cascade do |t|
    t.bigint "player_id", null: false
    t.bigint "match_id", null: false
    t.bigint "counter_id", null: false
    t.decimal "value", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["counter_id"], name: "index_player_counters_on_counter_id"
    t.index ["match_id"], name: "index_player_counters_on_match_id"
    t.index ["player_id", "match_id", "counter_id"], name: "count_once", unique: true
    t.index ["player_id"], name: "index_player_counters_on_player_id"
  end

  create_table "players", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "team_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "achievements", "counters"
  add_foreign_key "match_participants", "matches"
  add_foreign_key "match_participants", "teams"
  add_foreign_key "player_achievements", "achievements"
  add_foreign_key "player_achievements", "matches"
  add_foreign_key "player_achievements", "players"
  add_foreign_key "player_counters", "counters"
  add_foreign_key "player_counters", "matches"
  add_foreign_key "player_counters", "players"
  add_foreign_key "players", "teams"
end
