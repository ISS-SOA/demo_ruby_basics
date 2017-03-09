require 'json'

## Typical ruby hash -- keys are lookup data, values are result data
mybooks = {}
mybooks['The Unbearable Lightness of Being'] = 'Milan Kundera'
mybooks['Seven Pillars of Wisdom'] = 'T. E. Lawrence'

## Ruby hash in JSON style: keys are descriptives, values are all data
books = {}
books['books'] = []
books['books'].push('title' => 'The Unbearable Lightness of Being', 'author' => 'Milan Kundera')
books['books'].push('title' => 'Seven Pillars of Wisdom', 'author' => 'T. E. Lawrence')

## Serializing and deserializing
books_str = books.to_json
# {"The Unbearable Lightness of Being":"Milan Kundera","Seven Pillars of Wisdom":"T. E. Lawrence"}

puts books_str

JSON.load(books_str)
# {"books"=>[{"title"=>"The Unbearable Lightness of Being", "author"=>"Milan Kundera"}, {"title"=>"Seven Pillars of Wisdom", "author"=>"T. E. Lawrence"}]}

class Book
  attr_accessor :title, :author

  def initialize(title, author)
    @title = title
    @author = author
  end

  def to_json(*options)
    { 'book' => { 'title' => title, 'author' => author } }.to_json(*options)
  end
end

my_book = Book.new('The Unbearable Lightness of Being', 'Milan Kundera')
puts my_book.to_json

class Books
  def initialize
    @collection = []
  end

  def add_book(title, author)
    @collection << Book.new(title, author)
  end

  def to_json(*options)
    {library: @collection }.to_json(options)
  end
end

my_library = Books.new
my_library.add_book('The Unbearable Lightness of Being', 'Milan Kundera')
my_library.add_book('Seven Pillars of Wisdom', 'T.E. Lawrence')
puts my_library.to_json
