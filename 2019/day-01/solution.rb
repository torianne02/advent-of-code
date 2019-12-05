def get_mass_array
  File.read("2019/day-01/input.txt").split.map(&:to_i)
end

def get_fuel(mass)
  (mass / 3).floor - 2
end

# def get_fuels_fuel(mass, running_sum = 0)
#   return running_sum if mass <= 0 

#   fuel = get_fuel(mass)
  
#   return get_fuels_fuel(fuel, running_sum += fuel)
# end

# def fuel_counter_upper(mass_arr)
#   # fuels_sum = mass_arr.sum do |mass|
#   #   get_fuel(mass)
#   # end # 3376997

#   fuels_sum = 0
#   fuels_arr = mass_arr.map do |mass|
#     fuel = get_fuel(mass)
#     fuels_sum += fuel
#     fuel
#   end # 3376997

#   fuels_fuel_sum = fuels_arr.sum do |mass|
#     get_fuels_fuel(mass)
#   end # 1685504 -- 5062501

#   puts fuels_fuel_sum += fuels_sum #5062501
# end

# part 1 - works 
def fuel_counter_upper(mass_arr)
  needed_fuel = mass_arr.sum do |mass|
    get_fuel(mass)
  end
  puts needed_fuel
end 

fuel_counter_upper(get_mass_array)