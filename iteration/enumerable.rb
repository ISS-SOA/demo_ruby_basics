# frozen_string_literal: true

# Students in class
class Roster
  include Enumerable

  def initialize(*students)
    @students = students
  end

  def each
    @students.each { |student| yield student if block_given? }
  end
end

# Registered Student
class Student
  attr_reader :name, :id

  def initialize(name, id)
    @name = name
    @id = id
  end
end
