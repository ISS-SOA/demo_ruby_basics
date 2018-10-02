require 'yaml'
require_relative 'word_content'

module Document
  # Loads document information only when needed
  class LazyContentDocument
    include WordContent

    attr_reader :type
    attr_writer :title, :type, :author

    def initialize(path)
      @path = path
    end

    def read_document
      return if @content
      puts('Lazy Load')
      doc_yaml = YAML.load(File.read(@path))
      @title = doc_yaml['title']
      @type = doc_yaml['type']
      @author = doc_yaml['author']
      @content = doc_yaml['content']
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
