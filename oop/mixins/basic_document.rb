module Document
  # Stores information about documents
  class BasicDocument

    attr_accessor :title, :type, :author

    def initialize(title, type, author)
      @title = title
      @type = type
      @author = author
    end
  end
end
