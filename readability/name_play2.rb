# Compacted code

def formal_name(full_name)
  names = full_name.split
  middle = names[1..-2]
  middle_names = middle.map { |name| name[0] + '.' }.join(' ') unless middle.empty?
  [names.first, middle_names, names.last].compact.join(' ')
end
