# rubocop:disable all

# ARRAYS
# ------
# creating arrays
nums = [2, 3, 1, 4, 6, 9]
mixed = [13, "Hello", :happy, 3.194]
nums.length							            # => 6
nums.sort 							            # => [1, 2, 3, 4, 6, 9]
nums.sample                         # => 6

# String array notation
myname = "Soumya Ray"				       # => "Soumya Ray"
%w(hello Soumya Ray)               # => ["hello", "Soumya", "Ray"]
%W(hello #{myname})                # => ["hello", "Soumya Ray"]
%w(hello #{myname})  	             # => ["hello", "\#{myname}"]

# Array.select return a reduced array based on a condition
nums.select { |a| a > 2 }			      # => [3, 4, 6, 9]

# Array.map transforms every element of an array into a new array
nums.map { |a| a > 2 }				          # => [false, true, false, true, true, true]
nums.map { |a| a * 2 }				          # => [4, 6, 2, 8, 12, 18]
nums.map.with_index { |a, i| a*(i+1) }  # => [2, 6, 3, 16, 30, 54]

# Array.reduce collapses everything to one value
nums.reduce { |a, b| a.to_s + "-" + b.to_s }		# => "2-3-1-4-6-9"
nums.reduce(:+)                                 # => 25

# Array.each goes through each element in the array
mixed.each { |a| print a, "; " }
# 13; Hello; happy; 3.194;
mixed.each.with_index { |a, i| print i, ": ", a, "\n" }
# 0: 13
# 1: Hello
# 2: happy
# 3: 3.194
