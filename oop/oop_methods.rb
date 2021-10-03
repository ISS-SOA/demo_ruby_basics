class Document
  def initialize
    @accessed = 0
  end

  def describe_object
    @accessed += 1
    "Document object (you've asked #{@accessed} times)"
  end
end

doc = Document.new

doc.describe_object

doc.accessed

# Class methods
Document.methods
Object.methods

Document.methods - Object.methods
# => []

# Instance methods
Document.new.methods - Object.new.methods
# => [:describe_object]

# Reopen and add a class-level method
class Document
  puts 'Re-opening and changing Document'

  def self.describe_class
    'This is a Document class'
  end
end

Document.methods - Object.methods
# => [:describe_class]

Document.describe_class
# => "This is a Document class"
