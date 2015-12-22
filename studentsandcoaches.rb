require_relative 'environment.rb'
require_relative 'seed_data.rb'

puts "This'll be our main executable for the exercise."
puts "Coach Count: " + @coach_list.count.to_s
puts "Student Count: " + @student_list.count.to_s

def assign_students(student_list, coach_list)
  student_list.each do |student|
    #coach_list.sort! { |a,b| a.student_count <=> b.student_count }
    coach_list.sort_by! { |c| c.student_count }
    assigned_coach = coach_list.first
    puts "Assigning #{student[:name]} to coach: #{assigned_coach[:name]}"
    assigned_coach.add_student(student)
  end
end
