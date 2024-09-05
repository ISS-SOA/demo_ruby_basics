# frozen_string_literal: true

print 'Enter your first and last name: '
fullname = gets.chomp

puts "Hello #{fullname}, let's search the Internet about you (see browser)"

def website(names)
  search_terms = names.gsub(/[^a-zA-Z0-9]/, '+')
  "https://www.google.com/search?q=#{search_terms}"
end

system("open #{website(fullname)}")
