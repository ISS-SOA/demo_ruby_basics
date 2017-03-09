# Document - Stores the title, author, and contents of a document
class BasicDocument
  attr_reader :type
  attr_accessor :title, :author

  def initialize(title, type, author)
    @title = title
    @type = type
    @author = author
  end
end
