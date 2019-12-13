def get_orbit_data
  File.read("2019/day-06/input.txt").split
end

@orbitals = {}

def add_hash_keys_and_values(input)
  orbital_arr = input.split(')')
  @orbitals[orbital_arr[0]] = [] if !@orbitals.has_key?(orbital_arr[0])
  @orbitals[orbital_arr[0]] << orbital_arr[1]
end

def split_orbit_data(input)
  input.map { |orbit_val|   add_hash_keys_and_values(orbit_val) }
end 

def get_total_orbits(input)
  split_orbit_data(input)
  sum = 0

  @orbitals.each_value { |v| sum += v.length }
  # sum += @orbitals.length # Attempt 3: 3087 too low

  puts sum # Attempt 2: 1621 too low
end

get_total_orbits(get_orbit_data)

# puts @orbitals.length # Attempt 1: 1466 too low