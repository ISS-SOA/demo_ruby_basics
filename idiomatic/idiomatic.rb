# frozen_string_literal: true

require 'http'

def save_url(url_string, filename)
  raise ArgumentError, 'Valid URL must be provided' unless url_string
  raise ArgumentError, 'File name must be provided' unless filename
  raise IOError, 'File already exists' if File.exist?(filename)

  html = HTTP.get(url_string).body.to_s
  File.write(filename, html)
  html
rescue StandardError => e
  puts e.message
end

site_url, filename = ARGV
save_url(site_url, filename)
