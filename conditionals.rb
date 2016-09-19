
# ONE LINE CONDITIONALS
if age < 0
  puts "Please enter a positive number"
end

puts "Please enter a positive number" if age < 0

# GUARD CONDITIONALS
if !valid
  return false
else
  # Do something!
end

return false unless valid
# Do something!

# UNLESS OVER IF NOT
if country != "Taiwan"
  puts "This software only works in Taiwan"
  return
end

unless country == "Taiwan"
  puts "This software only works in Taiwan"
  return
end
