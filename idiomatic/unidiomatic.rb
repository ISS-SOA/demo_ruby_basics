
require 'http'

def save_url(url_string, filename)
  if url_string
    if filename
      if File.exists?(filename)
        raise ArgumentError, 'filename must be provided'
      else
        begin
          html = HTTP.get(url_string)
          File.write(filename, html)
        rescue StandardError => error
          raise IOError, error
        end
      end
    else
      raise ArgumentError, 'filename must be provided'
    end
  else
    raise ArgumentError, 'url_string must be provided'
  end

  html
end

# save_url('https://soumyaray.com', 'ray.html')
