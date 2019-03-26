require 'csv'

CSV.foreach('db/Pitching.csv',headers: true) do |row|
  Pitcher.create(
    player_id: row['playerID'],
    year_id: row['yearID'],
    stint: row['stint'],
    team_id: row['teamID'],
    lg_id: row['lgID'],
    wins: row['W'],
    losses: row['L'],
    games: row['G'],
    games_started: row['GS'],
    complete_games: row['CG'],
    shutouts: row['SHO'],
    saves: row['SV'],
    ipouts: row['IPouts'],
    hits: row['H'],
    error_counts: row['ER'],
    homeruns: row['HR'],
    bases_on_balls: row['BB'],
    strikes_outs: row['SO'],
    baopp: row['BAOpp'],
    earned_run_average: row['ERA'],
    intentional_walks: row['IBB'],
    wild_pitches: row['WP'],
    hit_by_pitches: row['HBP'],
    balks: row['BK'],
    batters_faced: row['BFP'],
    games_finished: row['GF'],
    runs: row['R'],
    sacrifice_hits: row['SH'],
    acrifice_flies: row['SF'],
    ground_into_double_plays: row['GIDP']
  )
end

CSV.foreach('db/Salaries.csv', headers: true) do |row|
  Salary.create(
    year_id: row['year_id'],
    team_id: row['team_id'],
    lg_id: row['lg_id'],
    player_id: row['player_id'],
    salary: row['salary']
  )
end