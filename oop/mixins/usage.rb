require_relative 'basic_document.rb'
require_relative 'content_document.rb'
require_relative 'lazy_content_document.rb'

path = File.expand_path(File.join(File.dirname(__FILE__), '../docs/'))

oop = Document::BasicDocument.new('article', 'OOP', 'Soumya')
oop.author
# => "Soumya"

invictus = Document::ContentDocument.new("#{path}/invictus.yml")
# "Loading file"
invictus.author
# => "Willam Ernest Henley"

miser = Document::LazyContentDocument.new("#{path}/miser.yml")
miser.content.size
# "Loading file"
# => "Aesop"
