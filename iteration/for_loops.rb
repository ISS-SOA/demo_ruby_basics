# rubocop:disable all
require 'open-uri'

sites = %w{slack facebook github codecademy canvaslms}

# PROCEDURAL FOR LOOPS
puts 'SCANNING SITES:'
titles = []
for site in sites
  html = URI.open("https://www.#{site}.com").read
  puts "#{site} scanned"
  capture = html.match(%r{<title>(?<title>.*)<\/title>})
  titles << (capture ? capture[:title] : nil)
end

puts "\nTITLES OF SITES:"

for title in titles
  puts title if title
end

longest_title = ''
for title in titles
  longest_title = title if title && (title.length > longest_title.length)
end

puts "\nLONGEST TITLE:"
puts longest_title
