class CreatePitchers < ActiveRecord::Migration[5.1]
  def change
    create_table :pitchers do |t|
      t.string :player_id
      t.integer :year_id
      t.integer :stint
      t.string :team_id
      t.string :lg_id
      t.integer :wins
      t.integer :losses
      t.integer :games
      t.integer :games_started
      t.integer :complete_games
      t.integer :shutouts
      t.integer :saves
      t.integer :ipouts
      t.integer :hits
      t.integer :error_counts
      t.integer :homeruns
      t.integer :bases_on_balls
      t.integer :strikes_outs
      t.decimal :baopp
      t.decimal :earned_run_average
      t.integer :intentional_walks
      t.integer :wild_pitches
      t.integer :hit_by_pitches
      t.integer :balks
      t.integer :batters_faced
      t.integer :games_finished
      t.integer :runs
      t.integer :sacrifice_hits
      t.integer :acrifice_flies
      t.integer :ground_into_double_plays

      t.timestamps
    end
  end
end
