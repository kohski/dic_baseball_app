require 'rails_helper'

describe Pitcher do
  it "counts most winning pitcher when one most winnig pitcher exists" do
    Pitcher.create(player_id:'taro',year_id:2000,wins:8)
    Pitcher.create(player_id:'jiro',year_id:2000,wins:9)
    Pitcher.create(player_id:'saburo',year_id:2000,wins:10)
    Pitcher.create(player_id:'shiro',year_id:2001,wins:10)
    expect(Pitcher.most_winners(2000)).to eq ['saburo']
  end
  it "counts most winning pitcher when more then 2 most winnig pitcher exists" do
    Pitcher.create(player_id:'taro',year_id:2000,wins:8)
    Pitcher.create(player_id:'jiro',year_id:2000,wins:10)
    Pitcher.create(player_id:'saburo',year_id:2000,wins:10)
    Pitcher.create(player_id:'shiro',year_id:2001,wins:10)
    expect(Pitcher.most_winners(2000)).to eq ['jiro','saburo']
  end

  it "counts most winning pitcher when more then no most winnig pitcher exists" do
    Pitcher.create(player_id:'taro',year_id:2001,wins:8)
    expect(Pitcher.most_winners(2000)).to eq []
  end

  it "top ten.同率10位がいない場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:15)
    Pitcher.create(player_id:'BBB',year_id:2000,wins:14)
    Pitcher.create(player_id:'CCC',year_id:2000,wins:13)
    Pitcher.create(player_id:'DDD',year_id:2000,wins:12)
    Pitcher.create(player_id:'EEE',year_id:2000,wins:11)
    Pitcher.create(player_id:'FFF',year_id:2000,wins:20)
    Pitcher.create(player_id:'GGG',year_id:2000,wins:19)
    Pitcher.create(player_id:'HHH',year_id:2000,wins:18)
    Pitcher.create(player_id:'III',year_id:2000,wins:17)
    Pitcher.create(player_id:'JJJ',year_id:2000,wins:16)
    Pitcher.create(player_id:'KKK',year_id:2000,wins:10)
    Pitcher.create(player_id:'LLL',year_id:2001,wins:10)
    expect(Pitcher.top_ten(2000)).to eq ['FFF','GGG','HHH','III','JJJ','AAA','BBB','CCC','DDD','EEE']
  end

  it "top ten.同率10位がいる場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:15)
    Pitcher.create(player_id:'BBB',year_id:2000,wins:14)
    Pitcher.create(player_id:'CCC',year_id:2000,wins:13)
    Pitcher.create(player_id:'DDD',year_id:2000,wins:12)
    Pitcher.create(player_id:'EEE',year_id:2000,wins:11)
    Pitcher.create(player_id:'FFF',year_id:2000,wins:20)
    Pitcher.create(player_id:'GGG',year_id:2000,wins:19)
    Pitcher.create(player_id:'HHH',year_id:2000,wins:18)
    Pitcher.create(player_id:'III',year_id:2000,wins:17)
    Pitcher.create(player_id:'JJJ',year_id:2000,wins:16)
    Pitcher.create(player_id:'KKK',year_id:2000,wins:11)
    Pitcher.create(player_id:'MMM',year_id:2000,wins:11)
    Pitcher.create(player_id:'LLL',year_id:2001,wins:10)
    expect(Pitcher.top_ten(2000)).to eq ['FFF','GGG','HHH','III','JJJ','AAA','BBB','CCC','DDD','EEE','KKK','MMM']
  end

  it "top ten.１０件に満たない場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:15)
    Pitcher.create(player_id:'BBB',year_id:2000,wins:14)
    Pitcher.create(player_id:'CCC',year_id:2000,wins:13)
    Pitcher.create(player_id:'DDD',year_id:2000,wins:12)
    Pitcher.create(player_id:'EEE',year_id:2000,wins:11)
    Pitcher.create(player_id:'FFF',year_id:2000,wins:20)
    Pitcher.create(player_id:'GGG',year_id:2000,wins:19)
    Pitcher.create(player_id:'HHH',year_id:2001,wins:18)
    expect(Pitcher.top_ten(2000)).to eq ['FFF','GGG','AAA','BBB','CCC','DDD','EEE']
  end

  it "top ten.1件もない場合" do
    Pitcher.create(player_id:'HHH',year_id:2001,wins:18)
    expect(Pitcher.top_ten(2000)).to eq []
  end

  it "top_winners_in_team.1人の場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:20,team_id:"kimkim")
    Pitcher.create(player_id:'BBB',year_id:2000,wins:19,team_id:"timtim")
    Pitcher.create(player_id:'CCC',year_id:2000,wins:18,team_id:"timtim")
    Pitcher.create(player_id:'DDD',year_id:2000,wins:17,team_id:"timtim")
    Pitcher.create(player_id:'EEE',year_id:2000,wins:16,team_id:"timtim")
    Pitcher.create(player_id:'FFF',year_id:2001,wins:21,team_id:"timtim")
    expect(Pitcher.top_winner_in_team(2000,'timtim')).to eq ['BBB']
  end
  it "top_winners_in_team.複数の場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:20,team_id:"timtim")
    Pitcher.create(player_id:'BBB',year_id:2000,wins:20,team_id:"timtim")
    Pitcher.create(player_id:'CCC',year_id:2000,wins:20,team_id:"kimkim")
    Pitcher.create(player_id:'DDD',year_id:2000,wins:17,team_id:"timtim")
    Pitcher.create(player_id:'EEE',year_id:2000,wins:16,team_id:"timtim")
    Pitcher.create(player_id:'FFF',year_id:2001,wins:21,team_id:"timtim")
    expect(Pitcher.top_winner_in_team(2000,'timtim')).to eq ['AAA','BBB']
  end
  it "top_winners_in_team.teamがない場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:20,team_id:"kimkim")
    Pitcher.create(player_id:'BBB',year_id:2000,wins:19,team_id:"kimkim")
    Pitcher.create(player_id:'CCC',year_id:2000,wins:18,team_id:"kimkim")
    Pitcher.create(player_id:'DDD',year_id:2000,wins:17,team_id:"kimkim")
    Pitcher.create(player_id:'EEE',year_id:2000,wins:16,team_id:"kimkim")
    Pitcher.create(player_id:'FFF',year_id:2001,wins:21,team_id:"kimkim")
    expect(Pitcher.top_winner_in_team(2000,'timtim')).to eq []
  end

  it "top_winner_in_term:一人の場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:20)
    Pitcher.create(player_id:'BBB',year_id:2001,wins:19)
    Pitcher.create(player_id:'CCC',year_id:2002,wins:18)
    Pitcher.create(player_id:'DDD',year_id:1999,wins:17)
    Pitcher.create(player_id:'EEE',year_id:2003,wins:16)
    Pitcher.create(player_id:'FFF',year_id:2000,wins:15)
    expect(Pitcher.top_winner_in_term(2000,2002)).to eq ['AAA']
  end

  it "top_winner_in_term:二人以上の場合" do
    Pitcher.create(player_id:'AAA',year_id:2000,wins:20)
    Pitcher.create(player_id:'BBB',year_id:2001,wins:19)
    Pitcher.create(player_id:'CCC',year_id:2002,wins:20)
    Pitcher.create(player_id:'DDD',year_id:1999,wins:17)
    Pitcher.create(player_id:'EEE',year_id:2003,wins:16)
    Pitcher.create(player_id:'FFF',year_id:2000,wins:15)
    expect(Pitcher.top_winner_in_term(2000,2002)).to eq ['AAA','CCC']
  end

  it "top_winner_in_term:その時期にピッチャーがいない場合" do
    Pitcher.create(player_id:'AAA',year_id:1999,wins:20)
    Pitcher.create(player_id:'BBB',year_id:1998,wins:19)
    Pitcher.create(player_id:'CCC',year_id:2010,wins:18)
    Pitcher.create(player_id:'DDD',year_id:2008,wins:17)
    Pitcher.create(player_id:'EEE',year_id:2006,wins:16)
    Pitcher.create(player_id:'FFF',year_id:1998,wins:15)
    expect(Pitcher.top_winner_in_term(2000,2002)).to eq []
  end

  it "top_winner_in_term:その時期にピッチャーがいない場合" do
    Pitcher.create(player_id:'AAA',year_id:1999,wins:20)
    Pitcher.create(player_id:'BBB',year_id:1998,wins:19)
    Pitcher.create(player_id:'CCC',year_id:2010,wins:18)
    Pitcher.create(player_id:'DDD',year_id:2008,wins:17)
    Pitcher.create(player_id:'EEE',year_id:2006,wins:16)
    Pitcher.create(player_id:'FFF',year_id:1998,wins:15)
    expect(Pitcher.top_winner_in_term(2000,2002)).to eq []
  end

  # ////////////////////////////////////////////////////////////

  it "top_winner_in_term:一人だけ" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 200000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_cost_performance(2000)).to eq ["taro"]
  end
  it "top_winner_in_term:複数人" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2000, salary: 200000)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 150000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_cost_performance(2000)).to eq ["taro","jiro"]
  end
  it "top_winner_in_term:給与データなし" do
    Pitcher.create(player_id: 'taro', year_id: 2000, wins: 20)
    Pitcher.create(player_id: 'jiro', year_id: 2000, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2000, wins: 10)
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'jiro', year_id: 2000, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2000, salary: 300000)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_cost_performance(2000)).to eq ["jiro"]
  end
  it "top_winner_in_term:投手データなし" do
    Pitcher.create(player_id: 'taro', year_id: 2001, wins: 10)
    Pitcher.create(player_id: 'jiro', year_id: 2001, wins: 15)
    Pitcher.create(player_id: 'saburo', year_id: 2001, wins: 20)
    Salary.create(player_id: 'taro', year_id: 2001, salary: 300000)
    Salary.create(player_id: 'jiro', year_id: 2001, salary: 250000)
    Salary.create(player_id: 'saburo', year_id: 2001, salary: 200000)
    expect(Pitcher.best_cost_performance(2000)).to eq []
  end

end