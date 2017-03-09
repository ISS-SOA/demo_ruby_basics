# WordContent - Add word related methods to classes that mix in this module
module WordContent
  attr_accessor :content

  def words
    content.split
  end

  def word_count
    words.size
  end
end
