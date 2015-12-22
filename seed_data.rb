require_relative 'lib/student.rb'
require_relative 'lib/coach.rb'

@coach_list = []
@student_list = []

def initialize_coaches
  @coach_list << Coach.create!({name: 'Coach Halford', work_ratio: 20})
  @coach_list << Coach.create!({name: 'Coach Pollard', work_ratio: 30})
  @coach_list << Coach.create!({name: 'Coach Danzig', work_ratio: 50})
end

def initialize_students
  student_info = [
    { name: 'Jill Hives' },
    { name: 'Holden Caulfield' },
    { name: 'Patrick Bateman' },
    { name: 'Margaret Lanterman' },
    { name: 'Jemmy Orphan' },
    { name: 'Danny Champion' },
    { name: 'Dale Cooper' },
    { name: 'Laura Palmer' },
    { name: 'Audrey Horne' },
    { name: 'Kim Deal' },
    { name: 'Heather Crazy' },
    { name: 'Mary Lee' },
    { name: 'Francis Farmer' },
    { name: 'Judy Punch' },
    { name: 'Vanessa Gresham' },
    { name: 'Ada Lovelace' },
    { name: 'Hunter Thompson' },
    { name: 'CC Deville' },
    { name: 'Paul Westerberg' },
    { name: 'Ian Mackaye' }
  ]

  student_info.each do |student|
    @student_list << Student.create(name: student[:name])
  end
end

initialize_coaches
initialize_students

@coach_list.first.add_work_ratio(20)
@coach_list.second.add_work_ratio(30)
@coach_list.third.add_work_ratio(50)
@coach_list.each do |c|
  puts c.work_ratio_percentage
end
