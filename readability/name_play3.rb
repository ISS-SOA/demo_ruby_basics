# Enhanced readability with methods

# abbreviates names: takes array of names, returns string
def abbreviated(words)
  words.map { |word| word[0] + '.' } unless words.empty?
end

# formalizes full name: takes string, returns string
def formal_name(full_name)
  names = full_name.split
  middle_names = names[1..-2]
  [names.first, abbreviated(middle_names), names.last].flatten.compact.join(' ')
end
