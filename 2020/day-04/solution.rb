def get_passport_data
  File.read("2020/day-04/input.txt").split("\n\n")
end

def find_num_of_valid_passports(passports)
  required_fields = [
    "byr",
    "iyr",
    "eyr",
    "hgt",
    "hcl",
    "ecl",
    "pid",
  ]

  valid_passports = 0

  passports.each do |passport|
    count = 0

    required_fields.each do |field|
      count += 1 if passport.include?(field)
    end

    valid_passports += 1 if count == required_fields.size
  end

  valid_passports
end

def find_num_of_valid_passports_with_constraints(passports)
  passports.map do |passport| 
    passport.scan(/(byr:(?:19[2-9][0-9]|200[0-2]))|(iyr:(?:201[0-9]|2020))|(eyr:(?:202[0-9]|2030))|(hgt:(?:(?:(?:59|6[0-9]|7[0-6])in)|(?:(?:1[5-8][0-9]|19[0-4])cm)))|(hcl:#(?:[0-9]|[a-f]){6})|(ecl:(?:amb|blu|brn|gry|grn|hzl|oth))|(pid:\d{9}(?:$| ))/)
      .map(&:compact)
      .flatten.length == 7
  end.count(true)
end

# Part 1
find_num_of_valid_passports(get_passport_data)
# Part 2
find_num_of_valid_passports_with_constraints(get_passport_data)