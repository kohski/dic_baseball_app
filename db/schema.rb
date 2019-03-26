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

ActiveRecord::Schema.define(version: 20190326023921) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pitchers", force: :cascade do |t|
    t.string "player_id"
    t.integer "year_id"
    t.integer "stint"
    t.string "team_id"
    t.string "lg_id"
    t.integer "wins"
    t.integer "losses"
    t.integer "games"
    t.integer "games_started"
    t.integer "complete_games"
    t.integer "shutouts"
    t.integer "saves"
    t.integer "ipouts"
    t.integer "hits"
    t.integer "error_counts"
    t.integer "homeruns"
    t.integer "bases_on_balls"
    t.integer "strikes_outs"
    t.decimal "baopp"
    t.decimal "earned_run_average"
    t.integer "intentional_walks"
    t.integer "wild_pitches"
    t.integer "hit_by_pitches"
    t.integer "balks"
    t.integer "batters_faced"
    t.integer "games_finished"
    t.integer "runs"
    t.integer "sacrifice_hits"
    t.integer "acrifice_flies"
    t.integer "ground_into_double_plays"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "salaries", force: :cascade do |t|
    t.integer "year_id"
    t.string "team_id"
    t.integer "lg_id"
    t.string "player_id"
    t.integer "salary"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
