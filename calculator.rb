# 1. string interpolation => #{}
# 2. extract repetitive logic to methods
# 3. keep track of variable types / classes
# 4. debugging with binding.pry => check & manipulate variables, continue with Ctrl+D
# 5. variable scope is determined by do...end
# 6. pass by ref if method mutates caller

require 'pry'

def say(s)
  puts "--- #{s} ---"
end

def get_number(question)
  say(question)
  answer = gets.chomp
  if answer.to_i.to_s == answer
    return answer
  elsif answer.to_f.to_s == answer
    return answer
  else
    say "That is not a valid number. Try again."
    get_number(question)
  end
end

def get_operation
  say "What do you what to do? 1) add, 2) substract, 3) multiply, 4) divide"
  operation = gets.chomp
  if [1, 2, 3, 4].include?(operation.to_i) 
    return operation
  else
    say "This is not a valid option. Try again."
    get_operation
  end
end


def give_answer(num1, num2, operation)
  num1_f = num1.to_f
  num2_f = num2.to_f
  if operation.to_i == 1
    answer = num1_f + num2_f
    say "#{num1} adds #{num2} equals #{answer}"
  elsif operation.to_i == 2
    answer = num1_f - num2_f
    say "Substracting #{num2} from #{num1} gives you #{answer}"
  elsif operation.to_i == 3
    answer = num1_f * num2_f
    say "#{num1} multiplied by #{num2} equals #{answer}"
  elsif operation.to_i == 4
    answer = num1_f / num2_f
    say "#{num1} divided by #{num2} equals #{answer}"
  end
end
    
num1 = get_number("Enter the first number:")

num2 = get_number("Enter the second number:")

operation = get_operation

give_answer(num1, num2, operation)
