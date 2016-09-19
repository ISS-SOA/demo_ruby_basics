# Non-idiomatic Ruby style

def formal_name(full_name)
  names = full_name.split
  middle = names[1..names.length-2]

  if middle.count > 0
    mids = middle.map { |mid| mid[0] + '.' }.join(' ')
    "#{names.first} #{mids} #{names.last}"
  else
    full_name
  end
end
