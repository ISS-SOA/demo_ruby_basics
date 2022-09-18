# Hash/Array data structures
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

library['books']

library['journals']

library.fetch('journals') do
  { 'journals' => []}
end

# Custom objects
class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end
end

my_book = Book.new('The Unbearable Lightness of Being', 'Milan Kundera')

class BookLibrary
  attr_reader :collection

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

## Serializing/Deserializing Hash/Array Data Structures

# Json
require 'json'

lightness_of_being.to_json

puts library.to_json

JSON.parse(library.to_json)


# Yaml serialization/deserialization
require 'yaml'

lightness_of_being.to_yaml

library.to_yaml

YAML.safe_load(library.to_yaml)


## Serializing/Deserializing Custom Objects

# Json serialization/deserialization

require 'json'

puts my_book.to_json

my_book = Book.new('The Unbearable Lightness of Being', 'Milan Kundera')
puts my_book.to_json

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

puts my_library.to_json

YAML.safe_load(my_book.to_yaml)

YAML.safe_load(my_library.to_yaml)

puts my_book.to_yaml

YAML.load(my_book.to_yaml)

puts my_library.to_yaml

YAML.load(my_library.to_yaml)
