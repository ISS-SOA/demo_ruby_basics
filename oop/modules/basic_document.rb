# frozen_string_literal: true

module Document
  # Stores information about documents
  class BasicDocument
    attr_reader :type
    attr_accessor :title, :author

    def initialize(title, type, author)
      @title = title
      @type = type
      @author = author
    end
  end
end
