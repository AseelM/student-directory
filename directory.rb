student_count = 11

students = [
  "Dr. Hannibal Lecter",
"Darth Vader",
"Nurse Ratched",
"Michael Corleone",
"Alex Delarge",
"The wicked witch of the west",
"Terminator",
"Freddy Krueger",
"The Joker",
"Joffrey Baratheon",
"Norman Bates"
]

puts "the students of Villains' Academy"
puts "-------------"

students.each do |student|
  puts student
end
puts "Overall, we have #{students.count} great students"
