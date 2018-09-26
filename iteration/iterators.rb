# Arrays are Enumerable types that can be iterated over
arr = [2, 3, 1, 6, 4, 9]

# Use #each to produce side-effects only (return value is just the same array)
arr.each { |n| puts "number #{n}" }

# Use #select to filter based on a true/false condition
arr.select { |n| n.odd? }
# more idiomatic form if you only calling a method from each element
arr.select(&:odd?)

# Use #map to return transformed elements
arr.map { |n| n * 2 }

# Use #reduce to return a single accumulated value
# provide a starting value (like 0) for the accumulator (total)
arr.reduce(0) { |total, n| total + n }
# if you don't provide a starting value, the first value is the starting value
arr.reduce { |n1, n2| n1 + n2 }

# Reduce is conceptually the most fundamental iterator
# Implementing #map using reduce
arr.reduce([]) { |collector, n| collector << n * 2 }

# Implementing #select using reduce
arr.reduce([]) { |collector, n| n.odd? ? collector << n : collector }

# Implementing #each using reduce
arr.reduce(nil) { |_, n| puts "number is: #{n}" }
