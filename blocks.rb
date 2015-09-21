# LOGGING EXAMPLE
def write_to_database(item)
  puts "Starting writing to database"
  result = DB.write(item)
  puts "Completing writing to database"
  result
end

def read_from_database(item_id)
  puts "Starting reading from database"
  item = DB.read(item_id)
  puts "Completing reading from database"
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
  with_logging("database write") { DB.write(item) }
end

def read_from_database(item_id)
  with_logging("database read") { DB.read(item_id) }
end

def read_from_cache(item_id)
  with_logging("cache read") do
    item = Cache.read(item_id)
    unless item
     item = DB.read(item_id)
     Cache.write(item)
    end
    item
  end
end
