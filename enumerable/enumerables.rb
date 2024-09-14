# frozen_string_literal: true

# Demonstration of Enumerable methods with Arrays and Hashes

# Array example
array = [1, 2, 3, 4, 5]

array.each do |num|
  puts "Number is: #{num}"
end

# Using map
doubled_array = array.map { |num| num * 2 }
puts "Doubled Values: #{doubled_array}"

# Hash example
hash = { first: 1, second: 2, third: 3 }

hash.each do |key, value|
  puts "#{key} value is: #{value}"
end

# Using map on hash values
doubled_hash = hash.map { |key, value| "#{key} value: #{value * 2}" }
puts "Doubled Values: #{doubled_hash}"
