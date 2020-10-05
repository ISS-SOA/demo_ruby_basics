# rubocop:disable all
# Demonstrate File I/O in Ruby

# FILE READING

# Open and read a file without using a block
yellow_file = File.open('yellow.txt', 'r')
while (line = yellow_file.gets)
  puts line
end
yellow_file.close # don't forget to close!!!

# Open and read a file using a block
File.open('yellow.txt', 'r') do |file|
  while (line = file.gets)
    puts line
  end
end # File.open closes file when block completes

# Open and read a file in one slurp!
# note: not advisable for very large files
red_lines = File.read('red.txt')
red_lines.split("\n")
puts red_lines

# FILE WRITING

# Open and (re)write a file using a block
song = 'Around The World'
lyric = "#{song}, #{song}"

File.open('world.txt', 'w') do |file|
  file.puts "\"#{song}\"\n\n"

  18.times do
    4.times { file.puts lyric }
    file.puts
  end
end

# Open and spit out many lines at once
song = 'Around The World'
lyric = "#{song}, #{song}"

world_lyrics = ""
18.times do
  4.times { world_lyrics << lyric + "\n" }
  world_lyrics <<  "\n"
end

File.write('world.txt', "\"#{song}\"\n\n", mode: 'w')
File.write('world.txt', world_lyrics, mode: 'a')
