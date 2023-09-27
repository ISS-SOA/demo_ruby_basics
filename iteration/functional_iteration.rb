require 'open-uri'

sites = %w[slack facebook github codecademy canvaslms]

# FUNCTIONAL ITERATION
puts 'SCANNING SITES:'
titles = sites.map do |site|
  html = URI.open("https://www.#{site}.com").read
  puts "#{site} scanned"
  capture = html.match(%r{<title>(?<title>.*)</title>})
  capture ? capture[:title] : nil
end

puts "\nTITLES OF SITES:"
titles.each { |title| puts title if title }

longest_title = titles.reduce('') do |t1, t2|
  t2 && (t2.length > t1.length) ? t2 : t1
end

puts "\nLONGEST TITLE:"
puts longest_title
