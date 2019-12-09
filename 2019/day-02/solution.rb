def get_opcode_arr
  File.read("2019/day-02/input.txt").split(',').map(&:to_i)
end

def calculate_opcode(opcode, input_1, input_2)
  return input_1 + input_2 if opcode == 1
  
  return input_1 * input_2 if opcode == 2 
end

def intcode_comp(num_1, num_2, arr)
  i = 0
  arr[1] = num_1
  arr[2] = num_2

  while arr[i] != 99
    opcode = arr[i]
    val_1 = arr[arr[i + 1]]
    val_2 = arr[arr[i + 2]]
    output = arr[i + 3]

    arr[output] = calculate_opcode(opcode, val_1, val_2)

    i += 4
  end 

  puts arr[0]
end

intcode_comp(12, 2, get_opcode_arr)