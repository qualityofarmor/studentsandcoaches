require_relative 'environment.rb'
require_relative 'seed_data.rb'

def assign_students(student_list, coach_list)
  student_list.each do |student|
    coach_list.sort_by! { |c| c.student_count }
    assigned_coach = coach_list.first
    #puts "Assigning #{student[:name]} to coach: #{assigned_coach[:name]}"
    assigned_coach.add_student(student)
  end
end

def assign_students_by_percentage(student_list, coach_list)
  # get array count
  total_student_count = student_list.count
  coach_list.each do |c|
    students_for_coach = []
    # Get an integer based on their percentage and the total count of the
    # student list.  We're going with the floor of that float, which might
    # produce a discrepency in dealing with all the students.
    # That overspill will be handled after this method completes
    # using the assign_students method that has already been written
    coaches_share = (c.work_ratio_percentage * total_student_count).floor
    students_for_coach = student_list.shift(coaches_share)
    puts "Assigning #{c[:name]} #{students_for_coach.count} students which is #{c.work_ratio_percentage*100}\%"
    assign_students(students_for_coach, [c])
  end

  #there could be some left over. return it so assign_students can appropriate it correctly
  student_list
end

# Demonstrate Solution for problem 1
initialize_coaches
initialize_students
puts "\n******** Problem 1 *********"
puts "Coach Count: #{@coach_list.count}"
puts "Student Count: #{@student_list.count}"
assign_students(@student_list, @coach_list)
puts "\n --- Problem 1 Distribution Report -- "
@coach_list.each do |c|
  puts "#{c[:name]} -> #{c.student_count}"
end

# Demonstrate Solution for problem 2
# initialize_coaches
# initialize_students
puts "\n******** Problem 2 *********"

# add a bit of variation
2.times { @student_list.pop }

puts "Coach Count: #{@coach_list.count}"
puts "Student Count: #{@student_list.count}"
assign_students(@student_list, @coach_list)
puts "\n --- Problem 2 Distribution Report -- "
@coach_list.each do |c|
  puts "#{c[:name]} -> #{c.student_count}"
end

# Demonstrate Solution for problem 3
initialize_coaches
@coach_list.first.add_work_ratio(20)
@coach_list.second.add_work_ratio(30)
@coach_list.third.add_work_ratio(50)

puts "\n******** Problem 3 *********"
puts "Coach Count: #{@coach_list.count}"
puts "Student Count: #{@student_list.count}"
leftover_students = assign_students_by_percentage(@student_list, @coach_list)
puts "LEFTOVER STUDENTS: #{leftover_students.count}"
#if any are left over, just tack them on to a coach that has the smallest work load
assign_students(leftover_students, @coach_list)
puts "\n --- Problem 3 Distribution Report -- "
@coach_list.each do |c|
  puts "#{c[:name]} -> Student Count: #{c.student_count} Work Ratio: #{c.work_ratio_percentage}"
end
