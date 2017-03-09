# Bookstore - for reading a directory of documents
class Bookstore
  attr_reader :docs

  def add_document(doc)
    @docs << doc
  end

  def load_content_documents(path)
    Dir.glob("#{path}/*.yml") do |filename|
      @docs << Document::LazyContentDocument.new(filename)
    end
  end

  def initialize
    @docs = []
  end
end
