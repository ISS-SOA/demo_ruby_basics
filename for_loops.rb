require 'open-uri'

sites = %w{slack facebook github codecademy canvaslms}
# => ["slack", "facebook", "github", "codecademy", "canvaslms"]

# PROCEDURAL FOR LOOPS
titles = []
for site in sites
  html = open("https://www.#{site}.com").read
  puts "#{site} scanned"
  capture = html.match(/<title>(?<title>.*)<\/title>/)
  titles << (capture ? capture[:title] : nil)
end

for title in titles
  puts title if title
end

longest_title = ''
for title in titles
  longest_title = title if (title && (title.length > longest_title.length))
end

# FUNCTIONAL ITERATION
titles = sites.map do |site|
  html = open("https://www.#{site}.com").read
  puts "#{site} scanned"
  capture = html.match(/<title>(?<title>.*)<\/title>/)
  capture ? capture[:title] : nil
end

titles.each { |title| puts title if title }

longest_title = titles.reduce('') do |t1, t2|
  (t2 && t2.length > t1.length) ? t2 : t1
end
