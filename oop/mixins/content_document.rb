require 'yaml'
require_relative 'word_content'

module Document
  # Reads document info upon initalization
  class ContentDocument
    include WordContent

    attr_reader :type
    attr_accessor :title, :author

    def initialize(path)
      puts 'Loading file'
      doc_yaml = YAML.load(File.read(path))
      @title = doc_yaml['title']
      @type = doc_yaml['type']
      @author = doc_yaml['author']
      @content = doc_yaml['content']
    end
  end
end
