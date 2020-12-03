def get_password_info
  File.read("2020/day-02/input.txt").split.map(&:to_i)
end

# Part 1
def valid_password?(policy, password)
  range, key =   policy.split(" ")
  range = range.split("-").map(&:to_i)

  password.count(key).between?(range[0].to_i, range[1].to_i) ? true : false
end

# Part 2
def valid_password?(policy, password)
  positions, key =   policy.split(" ")
  positions = positions.split("-").map(&:to_i)
  p_arr = password.split("")
  count = 0

  count += 1 if p_arr[positions[0] - 1] == key
  count += 1 if p_arr[positions[1] - 1] == key

  count == 1 ? true : false
end

def count_valid_passwords(all_passwords_and_policy)
  count = 0

  all_passwords_and_policy.each do |p_and_p|
    policy, password = p_and_p.split(": ")

    count += 1 if valid_password?(policy, password)
  end

  count
end

count_valid_passwords(get_password_info)
