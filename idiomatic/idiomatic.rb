require 'http'

def save_url(url_string, filename)
  raise ArgumentError, 'URL must be provided' unless url_string
  raise ArgumentError, 'file name must be provided' unless filename
  raise IOError, 'file already exists' if File.exist?(filename)

  html = HTTP.get(url_string).body.to_s
  File.write(filename, html)
  html
rescue StandardError => error
  raise IOError, error
end

site_url, filename = ARGV
save_url(site_url, filename)
