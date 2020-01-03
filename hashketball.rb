require 'pry'

def game_hash
	{
		away: { team_name: "Charlotte Hornets",
				colors: ["Turquoise", "Purple"],
				players: [
					{player_name: "Jeff Adrien",
						number: 4,
						shoe: 18,
						points: 10,
						rebounds: 1,
						assists: 1,
						steals: 2,
						blocks: 7,
						slam_dunks: 2},
					{player_name: "Bismack Biyombo",
						number: 0,
       					shoe: 16,
       					points: 12,
       					rebounds: 4,
       					assists: 7,
       					steals: 22,
       					blocks: 15,
       					slam_dunks: 10},
       				{player_name: "DeSagna Diop",
       					number: 2,
       					shoe: 14,
       					points: 24,
       					rebounds: 12,
       					assists: 12,
       					steals: 4,
       					blocks:5,
      					slam_dunks: 5},
      				{player_name: "Ben Gordon",
      					number: 8,
        				shoe:15,
        				points:33,
        				rebounds: 3,
        				assists: 2,
        				steals: 1,
        				blocks: 1,
        				slam_dunks: 0},
        			{player_name: "Kemba Walker",
        				number: 33,
       					shoe: 15,
       					points: 6,
       					rebounds: 12,
       					assists: 12,
       					steals: 7,
       					blocks: 5, 
       					slam_dunks: 12}

					]
			},
		home: { team_name: "Brooklyn Nets",
				colors: ["Black", "White"],
				players: [
					{player_name: "Alan Anderson",
     					number: 0,
     					shoe: 16,
     					points: 22,
     					rebounds: 12,
     					assists: 12,
     					steals: 3,
     					blocks: 1,
     					slam_dunks: 1},
     				{player_name: "Reggie Evans",
     					number: 30, 
     					shoe: 14,
     					points: 12,
     					rebounds: 12,
     					assists: 12,
     					steals: 12,
     					blocks: 12,
     					slam_dunks: 7},
     				{player_name: "Brook Lopez",
     					number: 11,
     					shoe: 17,
     					points: 17,
     					rebounds: 19,
     					assists: 10,
     					steals: 3,
     					blocks: 1,
     					slam_dunks: 15},
     				{player_name: "Mason Plumlee",
     					number: 1,
     					shoe: 19,
     					points: 26,
     					rebounds: 11,
     					assists: 6,
     					steals: 3,
     					blocks: 8,
     					slam_dunks: 5 },
     				{player_name: "Jason Terry",
     					number: 31,
     					shoe: 15,
     					points: 19,
     					rebounds: 2,
     					assists: 2,
     					steals: 4,
     					blocks: 11,
     					slam_dunks: 1}]}
	}
end


def num_points_scored(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:points]
          end 
        end 
      end
    end 
  end
end 

def shoe_size(players_name)
  game_hash.each do |place, team|
    team.each do |attribute, data|
      if attribute == :players
        data.each do |player|
          if player[:player_name] == players_name
            return player[:shoe]
          end 
        end 
      end
    end 
  end 
end 

def team_colors(team_name)
  game_hash.each do |place, team|
    if team[:team_name] == team_name
      return team[:colors]
    end 
  end 
end 

def team_names
  game_hash.map do |place, team|
    team[:team_name]
  end 
end 

def player_numbers(team_name)
  nums = []
  game_hash.map do |place, team|
    if team[:team_name] == team_name
      team.each do |attributes, data|
        if attributes == :players
          data.each do |player|
            nums << player[:number]
          end 
        end 
      end 
    end 
  end 
  nums
end 

def player_stats(players_name)
  new_hash = {}
  game_hash.each do |place, team|
    team.each do |attributes, data|
      if attributes == :players 
        data.each do |player|
          if player[:player_name] == players_name
            new_hash = player.delete_if do |k, v|
              k == :player_name
            end 
          end 
        end 
      end 
    end 
  end 
  new_hash
end 

def big_shoe_rebounds
  biggest_shoe_and_rebounds = [0,0]
  game_hash.each do |place, team|
    team[:players].each do |player_stats|
      if player_stats[:shoe] > biggest_shoe_and_rebounds[0]
        biggest_shoe_and_rebounds[0] = player_stats[:shoe]
        biggest_shoe_and_rebounds[1] = player_stats[:rebounds]
      end
    end
  end
  return biggest_shoe_and_rebounds[1]
end

def most_points_scored
  most_points_and_name = [0,""]
  game_hash.each do |place, team|
    team[:players].each do |player_stats|
      if player_stats[:points] > most_points_and_name[0]
        most_points_and_name[0] = player_stats[:points]
        most_points_and_name[1] = player_stats[:player_name]
      end
    end
  end
  return most_points_and_name[1]
end

def winning_team
  team_scores = {} # we will store each team's name and score here
  game_hash.each do |location, team_data|
    if !team_scores[:team_name]
      team_scores[team_data[:team_name]] = 0
    end
    team_data[:players].each do |player_stats| 
      team_scores[team_data[:team_name]] += player_stats[:points]
    end
  end
  return (team_scores.values[0] > team_scores.values[1]) ? team_scores.keys[0] : team_scores.keys[1]
end

def player_with_longest_name
  longest_name = ""
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats| 
      if player_stats[:player_name].length > longest_name.length
        longest_name = player_stats[:player_name]
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_steals = ["", 0]
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_stats| 
      if player_stats[:steals] > most_steals[1]
        most_steals = [player_stats[:player_name], player_stats[:steals]]
      end
    end
  end
  return (player_with_longest_name == most_steals[0])
end

