def check_if_ascending(input)
  return input.sort == input
end 

def check_if_repeat(input)
  prev = 0 
  input.map do |n|
    return true if prev == n 
    prev = n
  end
end 

def is_repeat_part_of_consecutive_group?(input)
  count = 0

  input.each_with_index do |num, i|
    if num == input[i + 1]
      count += 1 
    else 
      return true if count == 1
      count = 0
    end 
  end 

  return count == 1
end 

def find_possible_passwords(val_1, val_2)
  correct_count_part_1 = 0
  correct_count_part_2 = 0

  (val_1..val_2).each do |num|
    nums_arr = num.to_s.chars.map(&:to_i)
    if check_if_ascending(nums_arr) == true
      correct_count_part_1 += 1 if check_if_repeat(nums_arr) == true
      correct_count_part_2 += 1 if is_repeat_part_of_consecutive_group?(nums_arr) == true 
    end 
  end

  puts "part 1: #{correct_count_part_1}"
  puts "part 2: #{correct_count_part_2}"
end 

find_possible_passwords(172930, 683082) 