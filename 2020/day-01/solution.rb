def get_expense_report
  File.read("2020/day-01/input.txt").split.map(&:to_i)
end

def find_entries(num_entries_needed, target, report)
  report.combination(num_entries_needed)
    .detect { |nums| nums.sum == target }
    .reduce(:*)
end

# part 1 
find_entries(2, 2020, get_expense_report)

# part 2
find_entries(3, 2020, get_expense_report)