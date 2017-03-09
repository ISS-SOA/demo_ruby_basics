# WordContent - Add word related methods to classes that mix in this module
module WordContent
  attr_accessor :content

  def summary
    super + " (#{word_count} words)"
  end

  def words
    content.split
  end

  def word_count
    words.size
  end
end
