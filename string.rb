# STRINGS
# -----------------
myname = "Soumya Ray"				    # => "Soumya Ray"
myname.upcase                   #=> "SOUMYA RAY"
myname.downcase                 #=> "soumya ray"
myname.capitalize               #=> "Soumya ray"
myname.length		                # => 10

puts "hello #{myname}"				  # hello Soumya Ray
puts 'hello #{myname}'				  # hello #{myname}

# Break a string into an array of substrings or characters
myname[0]							# => "S"
myname[3]							# => "m"
myname.chars					# => ["S", "o", "u", "m", "y", "a", " ", "R", "a", "y"]
myname.split					# => ["Soumya", "Ray"]
"These are three\n lines of text\n with newlines".split("\n")
# => ["These are three", " lines of text", " with newlines"]
