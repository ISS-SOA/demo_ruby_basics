require 'open-uri'

sites = %w[slack github codecademy]

# FUNCTIONAL ITERATION
titles = sites.map do |site|
  html = URI.open("https://www.#{site}.com").read
  puts "#{site} scanned"
  capture = html.match(%r{<title>(?<title>.*)<\/title>})
  capture ? capture[:title] : nil
end

titles.each { |title| puts title if title }

longest_title = titles.reduce('') do |t1, t2|
  t2 && t2.length > t1.length ? t2 : t1
end

puts longest_title
