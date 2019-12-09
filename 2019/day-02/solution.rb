def get_comp_memory
  File.read("2019/day-02/input.txt").split(',').map(&:to_i)
end

def calculate_opcode(opcode, input_1, input_2)
  return input_1 + input_2 if opcode == 1
  
  return input_1 * input_2 if opcode == 2 
end

def intcode_comp(noun, verb, memory)
  address = 0
  memory[1] = noun
  memory[2] = verb

  while memory[address] != 99
    opcode = memory[address]
    param_1 = memory[memory[address + 1]]
    param_2 = memory[memory[address + 2]]
    output = memory[address + 3]

    memory[output] = calculate_opcode(opcode, param_1, param_2)

    address += 4
  end 

  return memory[0]
end

def find_noun_and_verb(goal)
  (1..100).each do |noun|
    (1..100).each do |verb|
      return (100 * noun + verb) if intcode_comp(noun, verb, get_comp_memory) == goal
    end 
  end 
end 

# Part 1
intcode_comp(12, 2, get_comp_memory)

# Part 2
find_noun_and_verb(19690720)