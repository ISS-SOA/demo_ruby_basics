# BasicDocument - Most basic version of a document, with no meta/mixins/etc.
class BasicDocument
  def title
    @title
  end

  def author
    @author
  end

  def type
    @type
  end

  def title=(new_title)
    @title = new_title
  end

  def author=(new_author)
    @author = new_author
  end

  def initialize(title, type, author)
    @title = title
    @type = type
    @author = author
  end
end
