# frozen_string_literal: true

# 1. NOTHING -- TESTS SHOULD FAIL

# 2. EMPTY METHOD -- TESTS SHOULD FAIL

# def formal_name(full_name)
# end

# 3. TESTS PASS BUT HARD TO READ

# def formal_name(full_name)
#   names = full_name.split
#   middle = names[1..names.length - 2]

#   if middle.count > 0
#     middle_names = middle.map { |mid| mid[0] + '.' }
#     [names.first, middle_names, names.last].join(' ')
#   else
#     full_name
#   end
# end

# 4. CLEARER FLOW OF CODE

# def formal_name(full_name)
#   names = full_name.split
#   middle = names[1..-2]
#   middle_names = middle.map { |name| name[0] + '.' }.join(' ') unless middle.empty?
#   [names.first, middle_names, names.last].compact.join(' ')
# end

# 5. WELL-NAMED METHODS

# # abbreviates names: takes array of names, returns string
# def abbreviated(words)
#   words.map { |word| word[0] + '.' } unless words.empty?
# end

# # formalizes full name: takes string, returns string
# def formal_name(full_name)
#   names = full_name.split
#   middle_initials = abbreviated(names[1..-2])
#   [names.first, middle_initials, names.last].flatten.compact.join(' ')
# end

# 6. CORRECT RUBY STYLE!

# # abbreviates names: takes array of names, returns string
# def abbreviated(words)
#   words.map { |word| "#{word[0]}." } unless words.empty?
# end

# # formalizes full name: takes string, returns string
# def formal_name(full_name)
#   names = full_name.split
#   middle_initials = abbreviated(names[1..-2])
#   [names.first, middle_initials, names.last].flatten.compact.join(' ')
# end
