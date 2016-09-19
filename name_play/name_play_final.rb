# Enhanced readability with methods

def abbreviated(names_array)
  names_array.map { |name| name[0] + '.' }.join(' ') unless names_array.empty?
end

def formal_name(full_name)
  names = full_name.split
  names = names[1..-2]
  [names.first, abbreviated_names(middle), names.last].compact.join(' ')
end
