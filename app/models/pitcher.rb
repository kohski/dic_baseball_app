class Pitcher < ApplicationRecord
  def self.most_winners(year)
    pitchers = Pitcher.where(year_id: year)
    self.get_max_win_pitchers_id(pitchers)
  end

  def self.top_ten(year)
    pitchers = Pitcher.where(year_id: year).order(wins: :desc)
  
    if pitchers.count < 10
      best_pitchers = pitchers
    else
      tenth_win = pitchers.limit(10)[9].wins
      best_pitchers = pitchers.where("wins >= ?",tenth_win)
    end
    best_pitchers.pluck(:player_id)
  end

  def self.top_winner_in_team(year,team)
    pitchers = Pitcher.where(year_id: year,team_id: team)
    self.get_max_win_pitchers_id(pitchers)
  end

  def self.top_winner_in_term(start_year,end_year)
    pitchers = Pitcher.where(year_id: start_year..end_year)
    self.get_max_win_pitchers_id(pitchers)
  end

  def self.best_cost_performance(year)
    pitchers = Pitcher.where(year_id: year)
    cost_performance = 0
    best_pitchers = []
    pitchers.each do |pitcher|
      if Salary.exists?(year_id: year, player_id: pitcher.player_id)
        win = pitcher.wins
        salary = Salary.find_by(year_id: year, player_id: pitcher.player_id).salary
        if cost_performance < win/salary.to_f
          cost_performance = win/salary.to_f
          best_pitchers = [pitcher]
        elsif cost_performance == win/salary.to_f
          best_pitchers.push(pitcher)
        end
      end
    end
    best_pitchers.pluck(:player_id)
  end

# ////////////////////////////////////////////////////

  def self.get_max_win_pitchers_id(pitchers)
    max_win = pitchers.maximum(:wins)
    best_pitchers = pitchers.where(wins: max_win)
    best_pitchers.pluck(:player_id)
  end

end
