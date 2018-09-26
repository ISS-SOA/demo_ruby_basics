
class Roster
  include Enumerable

  def initialize(*students)
    @students = students
  end

  def each
    @students.each { |student| yield student if block_given? }
  end
end
