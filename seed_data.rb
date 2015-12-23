require_relative 'lib/student.rb'
require_relative 'lib/coach.rb'

@coach_list = []
@student_list = []

def initialize_coaches
  @coach_list = []
  Coach.delete_all
  @coach_list << Coach.create!({name: 'Coach Halford'})
  @coach_list << Coach.create!({name: 'Coach Pollard'})
  @coach_list << Coach.create!({name: 'Coach Danzig'})
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
    { name: 'Ian Mackaye' },
    { name: 'Henry Rollins' }
  ]

  student_info.each do |student|
    @student_list << Student.create(name: student[:name])
  end
end
