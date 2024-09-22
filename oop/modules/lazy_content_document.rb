# frozen_string_literal: true

require 'yaml'

module Document
  # Loads document information only when needed
  class LazyContentDocument
    attr_writer :title, :type, :author, :content

    def initialize(path)
      @path = path
    end

    def read_document
      return if @content

      puts 'Loading content from file'
      doc_yaml = YAML.safe_load File.read(@path)
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

    def words
      content.split
    end

    def word_count
      words.size
    end
  end
end
