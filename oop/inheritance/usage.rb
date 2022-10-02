require_relative 'basic_document'
require_relative 'content_document'
require_relative 'lazy_content_document'

path = File.expand_path(File.join(File.dirname(__FILE__), '../docs/'))

oop = Document::BasicDocument.new('OOP Tutorial', 'textbook', 'Soumya Ray')
invictus = Document::LazyContentDocument.new("#{path}/invictus.yml")

oop.summary

invictus.summary

oop.class
oop.class.superclass

invictus.class
invictus.class.superclass
