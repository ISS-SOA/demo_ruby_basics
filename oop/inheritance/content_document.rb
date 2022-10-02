# frozen_string_literal: true

require 'yaml'
require_relative 'base_document'
require_relative 'word_content'

module Document
  # Reads document info upon initialization
  class ContentDocument < BaseDocument
    include WordContent

    def initialize(path)
      super()
      doc_yaml = YAML.safe_load(File.read(path))
      @title = doc_yaml['title']
      @type = doc_yaml['type']
      @author = doc_yaml['author']
      @content = doc_yaml['content']
    end
  end
end
