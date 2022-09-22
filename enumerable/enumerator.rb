# DEMONSTRATION OF ENUMERATOR ITERATIONS

letters = ('a'..'f').to_a
numbers = [1, 2, 3]

letters.each { |c| print "#{c}, " }
# a, b, c, d, e, f

numbers.cycle(2) { |n| print "#{n}, " }
# 1, 2, 3, => [1, 2, 3, 1, 2, 3]

each_name = ['soumya', 'ray'].each
each_name.next # => "soumya"
each_name.next # => "ray"
each_name.next
# (Error) StopIteration: iteration reached an end

cycled_number = numbers.cycle
each_letter = letters.each

loop do
  num = cycled_number.next
  char = each_letter.next
  puts [num, char].join(' - ')
end

# 1 - a
# 2 - b
# 3 - c
# 1 - d
# 2 - e
# 3 - f
