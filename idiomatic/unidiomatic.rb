require 'http'

def save_url(url_string, filename)
  if url_string
    if filename
      if File.exists?(filename)
        raise ArgumentError, 'file already exists'
      else
        begin
          html = HTTP.get(url_string)
          File.write(filename, html)
        rescue StandardError => error
          raise IOError, error
        end
      end
    else
      raise ArgumentError, 'file name must be provided'
    end
  else
    raise ArgumentError, 'valid URL must be provided'
  end

  html
end

site_url = ARGV[0]
filename = ARGV[1]
save_url(site_url, filename)
