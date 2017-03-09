require 'yaml'

module Document
  # Loads document information only when needed
  class LazyContentDocument
    attr_reader :type
    attr_writer :title, :type, :author, :content

    def initialize(path)
      @path = path
      @document_read = false
    end

    def read_document
      return if @document_read
      puts('Lazy Load')
      doc_yaml = YAML.load(File.read(@path))
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

    def words
      content.split
    end

    def word_count
      words.size
    end
  end
end
