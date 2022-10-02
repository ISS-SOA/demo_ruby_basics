require 'yaml'
require_relative 'base_document'
require_relative 'word_content'

module Document
  # Loads document information only when needed
  class LazyContentDocument < BaseDocument
    include WordContent

    def initialize(path)
      super()
      @path = path
      @document_read = false
    end

    def read_document
      return if @document_read

      doc_yaml = YAML.safe_load(File.read(@path))
      @title = doc_yaml['title']
      @type = doc_yaml['type']
      @author = doc_yaml['author']
      @content = doc_yaml['content']

      @document_read = true
    end

    def title
      read_document
      @title
    end

    def type
      read_document
      @type
    end

    def author
      read_document
      @author
    end

    def content
      read_document
      @content
    end
  end
end
