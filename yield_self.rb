# rubocop:disable all

# Chainable methods
'soumya ray'
  .split
  .map(&:capitalize)
  .join

# Non-chainable methods
def site_ok?(site)
  url = "https://#{site}"
  res = HTTP.get(url)
  ok = (res.status == 200)
  puts(ok ? 'site is ok' : 'site not ok')
end

def site_ok?(site)
  ok = (HTTP.get("https://#{site}").status == 200)
  puts(ok ? 'site is ok' : 'site not ok')
end

# pipeline style
def site_ok?(site)
  "https://#{site}"
    .yield_self { |url| HTTP.get(url) }
    .yield_self { |res| res.status == 200 }
    .yield_self { |ok | ok ? 'site is ok' : 'site not ok' }
    .yield_self { |msg| puts msg }
end

def site_ok?(site)
  "https://#{site}"
    .then { |url| HTTP.get(url) }
    .then { |res| res.status == 200 }
    .then { |ok | ok ? 'site is ok' : 'site not ok' }
    .then { |msg| puts msg }
end


# Small methods
def url_of(site)
  "https://#{site}"
end

def site_status(site)
  res = HTTP.get url_of(site)
  res.status
end

def msg(ok)
  ok ? 'site is ok' : 'site not ok'
end

def site_ok?(site)
  ok = (site_status(site) == 200)
  puts msg(ok)
end
