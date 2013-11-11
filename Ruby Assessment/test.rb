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

# a. i. Create a method to return the grade of a student, given that student's name. ii. Then use it to refactor your work in 3.i.

def grade(student_name)
	school[:students].each do |x|
		if x[:name] == student_name
			return x:[grade]
		end 
	end
end

grade("Marissa")