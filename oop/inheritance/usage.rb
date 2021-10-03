require_relative 'basic_document.rb'
require_relative 'content_document.rb'
require_relative 'lazy_content_document.rb'

path = File.expand_path(File.join(File.dirname(__FILE__), '../docs/'))

oop = Document::BasicDocument.new('OOP Tutorial', 'textbook', 'Soumya Ray')
invictus = Document::LazyContentDocument.new("#{path}/invictus.yml")

oop.summary

invictus.summary

oop.class
oop.class.superclass

invictus.class
invictus.class.superclass
