@students = []

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  try_load_students
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to file"
  puts "4. Load the list from file"
  puts "9. Exit"
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      puts "Please provide name of file"
      save_students(STDIN.gets.chomp)
      # STDIN.gets.chomp.nil? ? save_students : save_students(STDIN.gets.chomp)
    when "4"
      puts "Please provide name of file"
      # STDIN.gets.chomp.nil? ? load_students : load_students(STDIN.gets.chomp)
      load_students(STDIN.gets.chomp)
    when "9"
      exit
    else
      feedback(1)
  end
end

def show_students
  print_header
  print_students_list
  print_footer
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    name = STDIN.gets.chomp
  end

  if @students.length == 0
    puts "there are no students"
    exit
  end
end

def save_students(filename = students.csv)
  File.open(filename, "w") do |f2|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      f2.puts csv_line
    end
  end
  feedback(2)
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists? (filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def load_students(filename = "students.csv")
  File.open(filename, "r") do |f1|
    while line = f1.gets
      name, cohort = line.chomp.split(",")
      @students << {name: name, cohort: cohort.to_sym}
    end
  end
  feedback(3)
end

def feedback(number)
  case number
  when 1
    puts "I don't know what you mean, try again"
  when 2
    puts "students info is saved"
  when 3
    puts "student info is loaded from file"
  end
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"
end

def print_students_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

interactive_menu
