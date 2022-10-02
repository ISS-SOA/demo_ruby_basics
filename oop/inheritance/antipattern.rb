# frozen_string_literal: true

require_relative '../mixins/basic_document.rb'
require_relative '../mixins/content_document.rb'
require_relative '../mixins/lazy_content_document.rb'

def summary(doc)
  info = "#{doc.title} is a #{doc.type} by #{doc.author}"
  if doc.instance_of? Document::BasicDocument
    return info
  else
    return info + " (#{doc.word_count} words)"
  end
end

path = File.expand_path(File.join(File.dirname(__FILE__), '../docs/'))
oop = Document::BasicDocument.new('OOP Tutorial', 'textbook', 'Soumya Ray')
invictus = Document::ContentDocument.new("#{path}/invictus.yml")

summary(oop)
# => "OOP Tutorial is a textbook by Soumya Ray"
summary(invictus)
# => "Invictus is a poem by Willam Ernest Henley (103 words)"

# store = Bookstore.new
# store.add_document(oop)
# store.load_content_documents(path)
# store.count
