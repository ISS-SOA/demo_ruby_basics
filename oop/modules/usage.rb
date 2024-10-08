# frozen_string_literal: true

require_relative 'basic_document'
require_relative 'content_document'
require_relative 'lazy_content_document'

path = File.expand_path(File.join(__dir__, '../docs/'))

oop = Document::BasicDocument.new('OOP', 'article', 'Soumya')
oop.author

invictus = Document::ContentDocument.new("#{path}/invictus.yml")
invictus.author
invictus.word_count

miser = Document::LazyContentDocument.new("#{path}/miser.yml")
miser.author
miser.word_count
