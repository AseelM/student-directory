# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Krueger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]

def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty?
    students << {name: name, cohort: :november}
    name = gets.chomp
  end
  students
end

# def input_letter
#   puts "Please enter letter to filter names' list"
#   letter = gets.chomp
# end

def print_header
  puts "the students of Villains' Academy"
  puts "-------------"
end

# def print(students)
#   students.each.with_index(1) do |student, index|
#     puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# def print(students, with_letter)
#   students.each.with_index(1) do |student, index|
#     if student[:name][0] == with_letter
#       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

def print(students)
  students.each.with_index(1) do |student, index|
    if student[:name].length < 12
      puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
    end
  end
end


def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# with_letter = input_letter
print_header
print(students)
# print(students,with_letter)
print_footer(students)
