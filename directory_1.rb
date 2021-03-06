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

# def input_students
#   puts "Please enter the name of each student followed by their country"
#   puts "To finish, just hit return twice"
#   students = []
#   name = gets.chomp
#   country = gets.chomp
#   while !name.empty? and !country.empty?
#     students << {name: name, cohort: :november, country: country}
#     name = gets.chomp
#     country = gets.chomp
#   end
#   students
# end

def input_students
  puts "Please enter the student's name"
  puts "Enter typo incase of entering incorrect info"
  puts "To finish, just hit return twice"

  students = []
  name = gets.slice(0..-2)

  while !name.empty?
    if name == "typo"
      puts "No problem enter name again"
    else
      puts "Please enter the cohort"
      cohort = gets.chomp.to_sym
      if !cohort.empty?
        if cohort == "typo"
          puts "No problem enter cohort again"
          cohort = gets.chomp.to_sym
        else
          students << {name: name, cohort: cohort}
        end
      else
        students << {name: name, cohort: :november}
      end
    end
    puts "Please enter the student's name"
    name = gets.chomp
    end

  students
end

# def input_letter
#   puts "Please enter letter to filter names' list"
#   letter = gets.chomp
# end

def print_header
  puts "the students of Villains' Academy".center(70)
  puts "---------------------------------".center(70)
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

# def print(students)
#   students.each.with_index(1) do |student, index|
#     if student[:name].length < 12
#       puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def print(students)
#   accumulator = 0
#   while accumulator < students.length
#     puts "#{accumulator + 1}. #{students[accumulator][:name]} (#{students[accumulator][:cohort]} cohort)".center(60)
#     accumulator += 1
#   end
# end

def sort_by_cohort(students)
  students_by_cohort = {}

  students.each do |student|
    key = student[:cohort]
    name = student[:name]
    if students_by_cohort[key] == nil
    students_by_cohort[key] = []
    end
    students_by_cohort[key].push(name)
  end
  students_by_cohort
end

def print(students_by_cohort)
  students_by_cohort.each do |cohort, value|
    puts "#{cohort} cohort"
    value.each do |el|
      puts "#{el}"
    end
  end
end


def print_footer(students)
  if students.count == 1
    puts "\nOverall, we have a great student"
  else
    puts "\nOverall, we have #{students.count} great students"
  end
end

students = input_students
# with_letter = input_letter
print_header
# print(students)
students_by_cohort = sort_by_cohort(students)
print(students_by_cohort)
# print(students,with_letter)
print_footer(students)
