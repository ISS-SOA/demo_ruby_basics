module Document
  # Base class for all documents
  class BaseDocument
    attr_accessor :title, :type, :author

    def summary
      "#{title} is a #{type} by #{author}"
    end
  end
end
