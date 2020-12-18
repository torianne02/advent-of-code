def get_seats
  File.read("2020/day-05/input.txt").split("\n")
end

def get_seat_ids(seats)
  seats.map {|seat| seat.tr("BFRL", "1010").to_i(2) }
end 

# part 1
def find_highest_seat_id(seat_ids)
  seat_ids.max
end

# part 2
def find_my_seat(seat_ids)
  my_seat = (seat_ids.min...seat_ids.max).to_a - seat_ids
  my_seat.first
end

seat_ids = get_seat_ids(get_seats)
find_highest_seat_id(seat_ids)
find_my_seat(seat_ids)