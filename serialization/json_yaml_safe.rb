require 'json'

lightness_of_being = {
  'book' => {
    'title' => 'The Unbearable Lightness of Being',
    'author' => 'Milan Kundera'
  }
}

seven_pillars = {
  'book' => {
    'title' => 'Seven Pillars of Wisdom',
    'author' => 'T. E. Lawrence'
  }
}

library = { 'books' => [lightness_of_being, seven_pillars] }

# Represent a single book
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end

my_book = Book.new('The Unbearable Lightness of Being', 'Milan Kundera')
# => #<Book:0x007fd106bde0f0 @author="Milan Kundera", @title="The Unbearable Lightness of Being">

# Represent a collection of books
class BookLibrary
  def initialize
    @collection = []
  end

  def add_book(title, author)
    @collection << Book.new(title, author)
  end
end

my_library = BookLibrary.new
my_library.add_book('The Unbearable Lightness of Being', 'Milan Kundera')
my_library.add_book('Seven Pillars of Wisdom', 'T.E. Lawrence')
puts my_library.to_json
# "#<BookLibrary:0x007fd10824a848>"

## Data serializing into Json
lightness_of_being.to_json
# => "{\"book\":{\"title\":\"The Unbearable Lightness of Being\",\"author\":\"Milan Kundera\"}}"

puts library.to_json
# {"books":[{"book":{"title":"The Unbearable Lightness of Being","author":"Milan Kundera"}},{"book":{"title":"Seven Pillars of Wisdom","author":"T. E. Lawrence"}}]}

JSON.parse(library.to_json)
# {"books"=>[{"title"=>"The Unbearable Lightness of Being", "author"=>"Milan Kundera"}, {"title"=>"Seven Pillars of Wisdom", "author"=>"T. E. Lawrence"}]}


## Data serialization into YAML
require 'yaml'

lightness_of_being.to_yaml
# => "---\n" + "book:\n" + "  title: The Unbearable Lightness of Being\n" + "  author: Milan Kundera\n"

library.to_yaml
# => "---\n" +
# "books:\n" +
# "- book:\n" +
# "    title: The Unbearable Lightness of Being\n" +
# "    author: Milan Kundera\n" +
# "- book:\n" +
# "    title: Seven Pillars of Wisdom\n" +
# "    author: T. E. Lawrence\n"

YAML.safe_load(library.to_yaml)
# => {"books"=>
#   [{"book"=>{"title"=>"The Unbearable Lightness of Being", "author"=>"Milan Kundera"}},
#    {"book"=>{"title"=>"Seven Pillars of Wisdom", "author"=>"T. E. Lawrence"}}]}


## Object serialization and Json
puts my_book.to_json
# "#<Book:0x007fd10a252910>"

my_book = Book.new('The Unbearable Lightness of Being', 'Milan Kundera')
puts my_book.to_json
# "#<Book:0x007fd106b95080>"

class Book
  def to_json(*options)
    {
      'book' => {
        'title' => title,
        'author' => author
      }
    }.to_json(*options)
  end
end

class BookLibrary
  def to_json(*options)
    {library: @collection }.to_json(options)
  end
end

puts my_book.to_json
# {"book":{"title":"The Unbearable Lightness of Being","author":"Milan Kundera"}}

puts my_library.to_json
# {"library":[{"book":{"title":"The Unbearable Lightness of Being","author":"Milan Kundera"}},{"book":{"title":"Seven Pillars of Wisdom","author":"T.E. Lawrence"}}]}


YAML.safe_load(my_book.to_yaml)
# Psych::DisallowedClass: Tried to load unspecified class: Book
# from /Users/soumyaray/.rvm/rubies/ruby-2.4.0/lib/ruby/2.4.0/psych/class_loader.rb:97:in `find'

YAML.safe_load(my_library.to_yaml)
# Psych::DisallowedClass: Tried to load unspecified class: BookLibrary
# from /Users/soumyaray/.rvm/rubies/ruby-2.4.0/lib/ruby/2.4.0/psych/class_loader.rb:97:in `find'


## Object Marshalling in YAML

puts my_book.to_yaml
# --- !ruby/object:Book
# title: The Unbearable Lightness of Being
# author: Milan Kundera

YAML.load(my_book.to_yaml)
# => #<Book:0x007fd10a228908 @author="Milan Kundera", @title="The Unbearable Lightness of Being">


puts my_library.to_yaml
# --- !ruby/object:BookLibrary
# collection:
# - !ruby/object:Book
#   title: The Unbearable Lightness of Being
#   author: Milan Kundera
# - !ruby/object:Book
#   title: Seven Pillars of Wisdom
#   author: T.E. Lawrence

YAML.load(my_library.to_yaml)
# => #<BookLibrary:0x007fd1071350f8
#  @collection=
#   [#<Book:0x007fd107134e28 @author="Milan Kundera", @title="The Unbearable Lightness of Being">,
#    #<Book:0x007fd107134888 @author="T.E. Lawrence", @title="Seven Pillars of Wisdom">]>
