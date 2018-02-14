def get_first_name_of_season_winner(data, season)

  output_name = ""
  working_array = nil
  working_hash = {}

  data.each do |season_str, array_of_contestants|
    if season_str == season
      working_array = array_of_contestants
    end
  end

  working_array.each do |contestant_hash|
    contestant_hash.each do |attribute, data|
      if attribute == "status"
        if data == "Winner"
          working_hash = contestant_hash
        end
      end
    end
  end

  return working_hash["name"].split[0]

end

def get_contestant_name(data, occupation)
  data.each do |season_str, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      contestant_hash.each do |attribute, data|
        if data == occupation
          return contestant_hash["name"]
        end
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_str, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      contestant_hash.each do |attribute, data|
        if data == hometown
          counter += 1
        end
      end
    end
  end
  return counter
end

def get_occupation(data, hometown)
  data.each do |season_str, array_of_contestants|
    array_of_contestants.each do |contestant_hash|
      contestant_hash.each do |attribute, data|
        if data == hometown
          return contestant_hash["occupation"]
        end
      end
    end
  end
end

def get_average_age_for_season(data, season)

  sum_of_ages = 0
  num_of_contestants = 0
  working_array = []

  data.each do |season_str, array_of_contestants|
    if season_str == season
      working_array = array_of_contestants
    end
  end

  working_array.each do |contestant_hash|
    contestant_hash.each do |attribute, data|
      if attribute == "age"
        sum_of_ages += data.to_f
        num_of_contestants += 1
      end
    end
  end

  average = (sum_of_ages/num_of_contestants)
  return average.to_f.round

end
