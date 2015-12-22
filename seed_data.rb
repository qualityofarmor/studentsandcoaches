require_relative 'lib/student.rb'
require_relative 'lib/coach.rb'

@coach_list = []
@student_list = []

def initialize_coaches
  # Coaches
  @coach_one = Coach.create!(name: 'Coach Halford')
  @coach_two = Coach.create!(name: 'Coach Pollard')
  @coach_three = Coach.create!(name: 'Coach Danzig')
  @coach_list = [@coach_one, @coach_two, @coach_three]
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
    s = Student.create(name: student[:name])
    @student_list << s
  end
end

#students

initialize_coaches
initialize_students
