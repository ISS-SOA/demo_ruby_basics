require 'yaml'
require_relative 'inheritance/basic_document.rb'

# Author class for use with Document subtypes
class Author
  attr_accessor :fname, :mname, :lname

  def initialize(fname, mname, lname)
    @fname = fname
    @mname = mname
    @lname = lname
  end

  def to_s
    [@fname, @mname, @lname].join(' ').gsub(/  /, ' ')
  end
end

title = 'About Me'
type = 'Webpage'
author = Author.new('Soumya', '', 'Ray')

doc = Document::BasicDocument.new(title, type, author)

doc.summary
# => "About Me is a Webpage by Soumya Ray"

puts doc.to_yaml
