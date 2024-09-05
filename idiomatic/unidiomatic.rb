require 'http'

def save_url(url_string, filename)
  if url_string
    if filename
      if File.exist?(filename)
        raise ArgumentError, 'File already exists'
      else
        begin
          html = HTTP.get(url_string)
          File.write(filename, html)
        rescue StandardError => error
          raise IOError, error
        end
      end
    else
      raise ArgumentError, 'File name must be provided'
    end
  else
    raise ArgumentError, 'Valid URL must be provided'
  end

  html
rescue StandardError => error
  puts error.message
end

site_url = ARGV[0]
filename = ARGV[1]
save_url(site_url, filename)
