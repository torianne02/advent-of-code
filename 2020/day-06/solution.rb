def get_answers
  File.read("2020/day-06/input.txt").split("\n\n").map(&:split)
end 

def get_sum_of_counts(answers)
  sum = 0

  answers.each { |answer| sum += get_count(answer) }
  sum
end

# part 1
def get_count(answer)
  answer.join.chars.uniq.count
end

# part 2
def get_count(answer)
  answer.map(&:chars).reduce(&:&).length
end

get_sum_of_counts(get_answers)