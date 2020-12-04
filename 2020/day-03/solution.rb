def get_tree_map
  File.read("2020/day-03/input.txt").split("\n").map(&:chars).map { |line| line * 100 }
end

def trajectory_issues(tree_map, slopes)
  result = slopes.map do |slope|
    trees_hit = 0

    x = 0
    y = 0

    while y < tree_map.size
      trees_hit += 1 if tree_map[y][x] == '#'
      x += slope[0]
      y += slope[1]
    end

    trees_hit
  end.reduce { |n, res| n * res }
end 

# Part 1
slopes1 = [[3, 1]]
trajectory_issues(get_tree_map, slopes1)

# Part 2
slopes2 = [
  [1, 1],
  [3, 1],
  [5, 1],
  [7, 1],
  [1, 2]
]
trajectory_issues(get_tree_map, slopes2)