# frozen_string_literal: true

require_relative 'base_document'

module Document
  # Stores information about documents
  class BasicDocument < BaseDocument
    def initialize(title, type, author)
      super()
      @title = title
      @type = type
      @author = author
    end
  end
end
