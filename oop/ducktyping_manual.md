
## Object Oriented Programming in Ruby

Lets see how objects in ruby treat each other and what duck typing is all about.

### Ruby classes and objects
Let's start by creating a Ruby class to store certain information on courses offered in a school.

```ruby
class Course
  attr_accessor :title

  def initialize(title)
    @title = title
    @students = []
  end

  def add_student(student)
    @students << student
  end

  def print_students
    puts "Students: " + @students.join(', ')
  end
end
```

A couple of instance variables were created as part of the class.
First, `@title` is an instance variable and we create getter and setter methods for it by using `attr_accessor`.
Second, `@students` is also an instance variable but we do not create any methods that would allow anyone outside the class to access it. Both variables are private to their class by default.

Next, let's look at its methods.
We create an intializer method (`initialize`) that will set the `@title` to a given title, and then set `@students` as an empty array. We've given the class an `#add_students` method that inserts another element into the `@students` array. Note here that we have not specified what kind of object student must be. Ruby doesn't care. Lastly, there is a method called `#print_students` that simply joins the array of students together and prints it to STDOUT.

Enough talking, let's see our class in action, by running it in Pry.

```ruby
oopintro = Course.new('Intro to OOP')
=> #<Course:0x007fb3f31fcc88 @students=[], @title="Intro to OOP">
```
We created a new object! Let's see what we can do with it.

```ruby
puts oopintro
#<Course:0x007fb3f31fcc88>
=> nil
```
Ok, printing the object to screen doesn't seem to do anything interesting. That hexadecimal number (`0x007fb3f31fcc88`) is just the object's relative address in memory. Let's add some students to this course.

```ruby
oopintro.add_student('Lee')
=> ["Lee"]

oopintro.add_student('Elvis')
=> ["Lee", "Elvis"]

oopintro.print_students
'Students: Lee, Elvis'
=> nil
```
Sweet! Not only can we add students as `String` objects, we can then print them out easily with the `#print_students` method.

### Duck typing

The above example works fine. But but what if we wanted to represent students with a more complex object than just a `String`? Let's make a `Student` class to do just that.

```ruby
class Student
  attr_accessor :id, :fname, :lname

  def initialize(id, fname, lname)
    @id = id
    @fname = fname
    @lname = lname
  end

  def to_s
    "#{@fname} #{@lname} (id: #{@id.to_s})"
  end
end
```

Note that we have not defined what type of variables `id`, `fname`, and `lname` are. Also, you see that we have added our own `#to_s` method! Ruby objects all have a `#to_s` method so that all objects are serializable. We have simply overriden (overloaded) the default `#to_s` method of `Student` so that it becomes something more interesting when we treat it as a `String`.

Let's create a new `Student` type object and try printing it out.

```ruby
cesar = Student.new(9837212738, 'Cesar', 'Ordonez')
=> #<Student:0x007fd6ab096918
 # #@fname="Cesar",
 # @id=9837212738,
 # @lname="Ordonez">

puts cesar
'Cesar Ordonez (id: 9837212738)'
=> nil
```

Nice! `puts` now prints out something far more useful than just the address of the object. It seems that Ruby is using our `#to_s` method to serialize `cesar`.

But how would we modify the `Course` class so that it will accept `Student` objects?  In many object-oriented languages, we would have to redeclare the type of `@students` array in the `Course` class and rewrite any methods that use it. But not in Ruby.

Here is the magic of duck typing: `Course` doesn't care what kind of student object we give it, as long as it can fulfill any methods that are called on it. Let's simply go ahead and add our newly created `Student` type object to our `oopintro` object.

```ruby
oopintro.add_student(cesar)
=> ["Lee",
 "Elvis",
 <Student:0x007fd6ab096918
  @fname="Cesar",
  @id=9837212738,
  @lname="Ordonez">]
```

Great! Ruby allows us to add a completely different type of object to the `@students` array within `oopintro`. But now that we have added students of `String` and `Student` types, what will happen if we call `#print_students`?

```ruby
oopintro.print_students
'Students: Lee, Elvis, Cesar Ordonez (id: 9837212738)'
```

Looks like it prints out each object of its array appropriately! If you look back at our definition of `#print_students` in the `Course` class, you'll see that it uses the `#join` method to convert students into a big string. This means that `#join` is calling the `#to_s` method of each object to serialize them first. It treats our `Student` object just like any other, and calls the custom `#to_s` method we wrote for `Student`.

This is a demonstration of **duck typing**. Ruby doesn't care about the ancestry of objects. It does not discriminate objects based on what class they *inherit* from (the way an aristocratic society might care about your family's background). Instead, it only cares that objects can *fulfill the methods* called upon them (its a true meritocracy!). We call this duck typing because if an object 'walks like a duck and swims like a duck and quacks like a duck' then we can simply treat it like a duck.
