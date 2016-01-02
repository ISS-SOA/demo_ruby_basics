# EVERYTHING IS AN OBJECT
# -----------------------
# Basic objects
'asdf'				# Strings
4					  	# Numbers
:taiwan				# Symbols
[]						# Array: indexed values
{}						# Hash: key-value pairs

# Objects have methods (behaviors)
'hello'						        # => "hello"
'hello'.upcase						# => "HELLO"
'hello'.reverse						# => "olleh"

# some methods can take a block of code as input
5.times { print 'hello;' }  # hello;hello;hello;hello;hello;=> 5

# Operators are methods too
5 + 13							# => 18
5.+ 13							# => 18
'hello! ' * 5  			# => "hello! hello! hello! hello! hello! "
'hello! '.* 5				# => "hello! hello! hello! hello! hello! "

# Objects can return new object with different type
42.to_s             # => "42"
'42'.to_i           # => 42
