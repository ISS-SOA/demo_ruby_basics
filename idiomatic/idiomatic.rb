
require 'http'

def save_url(url_string, filename)
  raise ArgumentError, 'url_string must be provided' unless url_string
  raise ArgumentError, 'filename must be provided' unless filename
  raise IOError, 'file already exists' if File.exist?(filename)

  html = HTTP.get(url_string).body.to_s
  File.write(filename, html)
  html
rescue StandardError => error
  raise IOError, error
end

# save_url('https://soumyaray.com', 'ray.html')
