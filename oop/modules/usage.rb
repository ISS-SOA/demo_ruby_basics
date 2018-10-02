require_relative 'basic_document.rb'
require_relative 'content_document.rb'
require_relative 'lazy_content_document.rb'

path = File.expand_path(File.join(__dir__, "../docs/"))

oop = Document::BasicDocument.new('article', 'OOP', 'Soumya')
oop.author

invictus = Document::ContentDocument.new("#{path}/invictus.yml")
invictus.author

miser = Document::LazyContentDocument.new("#{path}/miser.yml")
miser.content.size
