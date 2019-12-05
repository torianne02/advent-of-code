def get_mass_array
  File.read("2019/day-01/input.txt").split.map(&:to_i)
end

def get_fuel(mass)
  (mass / 3).floor - 2
end

def get_fuels_fuel(mass, running_sum = 0)
  fuel = get_fuel(mass)
  fuel > 0 ? get_fuels_fuel(fuel, running_sum += fuel) : running_sum
end

def fuel_counter_upper(mass_arr)
  fuel_sum = mass_arr.sum do |mass|
    fuel = get_fuel(mass)
    fuels_fuel = get_fuels_fuel(fuel)
    fuel + fuels_fuel
  end 
  
  return fuel_sum
end

fuel_counter_upper(get_mass_array)