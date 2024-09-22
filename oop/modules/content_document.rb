# frozen_string_literal: true

require 'yaml'

module Document
  # Reads document info upon initalization
  class ContentDocument
    attr_reader :type
    attr_accessor :title, :author, :content

    def initialize(path)
      puts 'Loading content from file'
      doc_yaml = YAML.load(File.read(path))
      @title = doc_yaml['title']
      @type = doc_yaml['type']
      @author = doc_yaml['author']
      @content = doc_yaml['content']
    end

    def words
      content.split
    end

    def word_count
      words.size
    end
  end
end
