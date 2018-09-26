# Lambdas are functions that we can define whenever we need them
doubler = lambda { |n| n * 2 }
# more idiomatic for one-liner lambda:
doubler = ->(n) { n * 2 }

# They are objects that are invoked using #call
doubler.call(3)

# We can even pass lambdas to methods to invoke later
def process(number, processor)
  puts 'STARTING PROCESSING'
  result = processor.call(number)
  puts 'END PROCESSING'
  result
end

process(3, doubler)

# Blocks are an implicit way of passing in an anonymous function
def process2(number)
  puts 'STARTING PROCESSING'
  result = yield number
  puts 'END PROCESSING'
  result
end

process2(3) { |n| n * 2 }
process2(3) # error?

# Using the block_given? keyword
def yielder
  puts 'STARTING YIELDING'
  yield if block_given?
  puts 'END YIELDING'
end
