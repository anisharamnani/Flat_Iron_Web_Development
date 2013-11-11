# Section 1: Arrays
array = ["Blake","Ashley","Jeff"]

# a. Add an element to the array

array.push("Avi")

# b. Write a statement to print out all the elements of the array.

puts array

# c. Return the value at index 1.

puts array[1]

# d. Return the index for the value "Jeff".

puts array[2]

# Section 2: Hashes 
 
instructor = {:name=>"Ashley", :age=>27}

# a. Add a new key for location and give it the value "NYC".

instructor[:location] = "NYC"

# b. Write a statement to print out all the key/value pairs in the hash

instructor.each { |key, value| puts "#{key}: #{value}" }

# c. Return the name value from the hash.

puts instructor[:name]

# d. Return the key name for the value 27.

puts instructor.index(27)

# Section 3: Nested Structures

school = { 
	:name => "Happy Funtime School",
	:location => "NYC",
  :instructors => [ 
		{:name=>"Blake", :subject=>"being awesome" },
		{:name=>"Ashley", :subject=>"being better than blake"},
		{:name=>"Jeff", :subject=>"karaoke"}
  ],
	:students => [ 
		{:name => "Marissa", :grade => "B"},
		{:name=>"Billy", :grade => "F"},
		{:name => "Frank", :grade => "A"},
		{:name => "Sophie", :grade => "C"}
  ]
}
# a. Add a key to the school hash called "founded_in" and set it to the value 2013.

school[:founded_in] = 2013

# b. Add a student to the school's students' array.

school[:students].push({:name => "Anisha", :grade => "F"})

# c. Remove "Billy" from the students' array.

# CHECK: might be an easier way 

school[:students].delete({:name => "Billy", :grade => "F"})

# d. Add a key to every student in the students array called "semester" and assign it the value "Summer".

school[:students].each{|student| student[:semester] = "Summer"}

# e. Change Ashley's subject to "being almost better than Blake"

school[:instructors].each do |x|
	if x[:name] == "Ashley"
		x[:subject] = "being almost better than Blake"
	end
end

# alternative, but not as good: school[:instructors][1][:subject] = "being almost better than Blake"

# f. Change Frank's grade from "A" to "F".

school[:students].each do |x|
		if x[:name] == "Frank"
			x[:grade] = "F" 
		end 
end 

# alternative, but not as good: school[:students][1][:grade] = "F"

# g. Return the name of the student with a "B".

school[:students].each do |x|
		if x[:grade] == "B"
			puts x[:name]
  	end
end

# h. Return the subject of the instructor "Jeff".

school[:instructors].each do |x|
	if x[:name] == "Jeff"
		puts x[:subject]
	end
end

# i. Write a statement to print out all the values in the school. ***FLAG

# Section 4: Methods 

# a. i. Create a method to return the grade of a student, given that student's name. #ii. Then use it to refactor your work in 3.i.

def grade(school_name,student_name)
	school_name[:students].each {|x| return x[:grade] if x[:name] == student_name}
end

puts grade(school, "Marissa")

# b. i.Create a method to udpate a instructor's subject given the instructor and the new subject. 

 
def change_subject(instructor, new_subject, school_name)
	school_name[:instructors].each do |x|
		if x[:name] == instructor
			return x[:subject] = new_subject
		end
	end
end

# ii. Then use it to update Blake's subject to "being terrible".

change_subject("Blake", "being terrible", school)

# c. i. Create a method to add a new student to the schools student array.

def add_student(new_student, new_grade, new_semester, school_name)
	school_name[:students].push({:name => new_student, :grade => new_grade, :semester => new_semester})
end 

# ii. Then use it to add yourself to the school students array.

add_student("Anisha", "F", "Summer", school)

# d. i. Create a method that adds a new key at the top level of the school hash, given a key and a value. 

def new_key(key, value, hash)
	hash[key] = value 
end 

# ii. Then use it to add a "Ranking" key with the value 1.

new_key("Ranking", 1, school)

# Section 5: Object Orientation

# a. Create a bare bones class definition for a School class.

class School

# b. Define an initialize method for the School class.

# i. Give your School class the instance variables: name, location, ranking, students, instructors. NOTE: These variables should be of the same type as they are in the hash above.

# ii. Rewrite your initialize method definition to take a parameter for each instance variable.

# iii. Initialize each instance variable with the value of the corresponding parameter.

  def initialize(name, location, ranking, instructors)
    @students = []
    @name = name.to_sym 
    @location = location.to_sym 
    @ranking = ranking.to_sym 
    @instructors = instructors
  end 

# c. Create an attr_accessor for name, location, instructors, and students. Create an attr_reader for ranking.

  attr_accessor :name 
  attr_accessor :location 
  attr_accessor :instructors 
  attr_accessor :students
  attr_reader :ranking

# d. Create a method to set ranking, given a ranking value.

  def ranking(rank)
    @ranking = rank
  end 

# e. Create a method to add a student to the school, given a name, a grade, and a semester.

  def add_student(name, grade, semester)
    students.push [{name => name, :grande => grade, :semester => semester}]
  end 

# f. Create a method to remove a student from the school, given a name.

  def remove_student(name) 
    @student.each_with_index do |x, index|
    if x[:name] == name
      @students.delete_at(index)
    end
  end 
end

# g. Create an array constant SCHOOLS that stores all instances of your School class.

# CHECK: I'm unsure if this is the right code.

=begin
  SCHOOLS = []

# h. Create a class method reset that will empty the SCHOOLS constant.


  def self.reset
      SCHOOL.clear
  end
=end

# Section 6: Classes 

# a. Create a Student class.

class Student < School 
  attr_accessor :name 
  attr_accessor :grade 
  attr_accessor :semester

# b. Refactor your School instance methods to treat Students as an array of objects instead of an array of hashes.

  def initialize(name, grade, semester)
    @name = name
    @grade = grade
    @semester = semester
  end 
end

# c. Create a method in the School class that finds a student by name and returns the correct Student object.

# CHECK: unsure what to write here. 

# Section 7: Self 

=begin 

For this section, please use the letters and answer each individually.

Note: in cases where self is an instance of an object just note that as the object id printed to the screen is going to be different everytime

a.What should this Class print to the screen when defined/loaded?

  class Student

    def self.say_hello
      puts "hello"
    end

    say_hello
    puts self

  end

ANSWER: This class prints "hello" and Student =] 

b. What should this Class print to the screen when defined/loaded?

  class Student

    def self.say_hello
      puts self
    end

    say_hello

  end

ANSWER: This class would print Student. 

c. What should this Class print to the screen when defined/loaded?

  class Student

    def initialize
      puts self
    end

    new

  end

ANSWER: CHECK: unknown

d. What should this code print to the screen when run?

  class Student

    def say_hello
      puts self
    end

  end
Student.new.say_hello

ANSWER: CHECK: unknown. 

e. What should this code print to the screen when run?

  class Student

    def say_hello
      puts say_goodbye
    end

    def say_goodbye
      "goodbye"
    end

  end
Student.new.say_hello

ANSWER: This would print good bye. :(
=end 