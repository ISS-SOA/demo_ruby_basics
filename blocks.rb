# BASIC BLOCKS

def my_method
  puts 'Starting my method'
  yield
  puts 'Ending my method'
end

my_method
# Starting my method
# LocalJumpError: no block given (yield)

status = 'Running the block'
my_method { puts status }
# Starting my method
# Running the block
# Ending my method

# One use of blocks is to setup/teardown before an operation
def write_to_db
  db = [] # open database
  yield db
  puts "DB: #{db}" # close database
end

# now we don't have to worry about opening/closing database for writes:
write_to_db { |database| database << 5 }

## Strategies using Blocks
# unidiomatic
def func(x, y)
  if block_given?
    result = yield x, y
  else
    result = x * y
  end

  "Result: #{result}"
end

#idiomatic
def func(x, y, &strategy)
  result = strategy ? yield(x, y) : x * y
  "Result: #{result}"
end

func(2.0, 3.0)
# => "Result: 6.0"

func(2.0, 3.0) { |num1, num2| num1 / num2 }
# => "Result: 0.6666666666666666"

## LOGGING EXAMPLE (no blocks)
def write_to_database(item)
  puts 'Starting writing to database'
  result = DB.write(item)
  puts 'Completing writing to database'
  result
end

def read_from_database(item_id)
  puts 'Starting reading from database'
  item = DB.read(item_id)
  puts 'Completing reading from database'
  item
end


# LOGGING WITH BLOCKS
def with_logging(description)
  puts "Starting #{description}"
  value = yield
  puts "Completing #{description}"
  value
end

def write_to_database(item)
  with_logging('database write') { DB.write(item) }
end

def read_from_database(item_id)
  with_logging('database read') { DB.read(item_id) }
end

def read_from_cache(item_id)
  with_logging('cache read') do
    Cache.read(item_id) || encache_from_db(item_id)
  end
end

def encache_from_db(item_id)
  item = DB.read(item_id)
  Cache.write(item)
  item
end
