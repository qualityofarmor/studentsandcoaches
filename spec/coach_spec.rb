describe Coach do
  it 'saves to the database' do
    coach = Coach.create(name: 'Coach Chilton')
    coach.save
    coach_record = Coach.where(name: 'Coach Chilton').first
    expect(coach_record[:name]).to eq 'Coach Chilton'
  end

  it 'has a name' do
    coach = Coach.new({name: 'Coach Mould'})
    coach.save
    expect(coach[:name]).to eq 'Coach Mould'
  end

  it 'can have no student affiliation' do
    coach = Coach.create(name: 'Coach Grohl')
    expect(coach.student_count).to eq 0
  end

  it 'can have one student affiliation' do
    coach = Coach.create({name: 'Coach Cobain'})
    student_1 = Student.create({name: "Dee Seven"})
    coach.add_student(student_1)
    expect(coach.student_count).to eq 1
  end

  it 'can have several student affiliations' do
    coach = Coach.create({name: 'Coach Novoselic'})
    student_1 = Student.create({name: 'Francis Farmer'})
    student_2 = Student.create({name: 'Abouta Girl'})
    student_3 = Student.create({name: 'Dee Seven'})
    student_list = [student_1, student_2, student_3]

    student_list.each do |s|
      coach.add_student(s)
    end
    expect(coach.student_count).to eq 3
  end

# PROBLEM #1
  it 'is assigned students in accordance with a collective and even distribution' do
      coach_list = []
      coach_list << Coach.create!(name: 'Coach Halford')
      coach_list << Coach.create!(name: 'Coach Pollard')
      coach_list << Coach.create!(name: 'Coach Danzig')

      student_list = []
      student_list << Student.create({name: 'Ava Minor'})
      student_list << Student.create({name: 'Bee Sharpe'})
      student_list << Student.create({name: 'Cilia Seven'})
      student_list << Student.create({name: 'Dee Major'})
      student_list << Student.create({name: 'Ealia Flatt'})
      student_list << Student.create({name: 'Eff Adnine'})
      student_list << Student.create({name: 'Ohpen Jee'})

      assign_students(student_list, coach_list)
      # coach_list.sort_by! { |c| c.student_count }
      puts "\n --- POST ASSIGNMENT NUMBERS -- "
      coach_list.each do |c|
        puts "#{c[:name]} -> #{c.student_count}"
      end

      expect(coach_list.first.student_count).to eq 3
      expect(coach_list.second.student_count).to eq 2
      expect(coach_list.third.student_count).to eq 2

  end

# PROBLEM 2
it 'is assigned students evenly despite the existance of previously assigned students' do
    coach_list = []
    coach_list << Coach.create!(name: 'Coach Halford')
    coach_list << Coach.create!(name: 'Coach Pollard')
    coach_list << Coach.create!(name: 'Coach Danzig')

    student_list = []
    student_list << Student.create({name: 'Thomas Waits'})
    student_list << Student.create({name: 'Brian Wilson'})
    student_list << Student.create({name: 'David Byrne'})
    student_list << Student.create({name: 'Tobin Sprout'})
    student_list << Student.create({name: 'Josaphene Wiggs'})
    student_list << Student.create({name: 'Herbie Flowers'})
    student_list << Student.create({name: 'Keith Richards'})

    assign_students(student_list, coach_list)
    # coach_list.sort_by! { |c| c.student_count }
    puts "\n --- PROBLEM Num. 2 POST ASSIGNMENT NUMBERS -- "
    coach_list.each do |c|
      puts "#{c[:name]} -> #{c.student_count}"
    end

    expect(coach_list.first.student_count).to eq 3
    expect(coach_list.second.student_count).to eq 2
    expect(coach_list.third.student_count).to eq 2

    student_list = []
    student_list << Student.create({name: 'Chris Bell'})
    student_list << Student.create({name: 'Alex Chilton'})
    student_list << Student.create({name: 'Joan Jett'})
    student_list << Student.create({name: 'Kathleen Hanna'})
    student_list << Student.create({name: 'Elliott Smith'})

    assign_students(student_list, coach_list)
    puts "\n --- PROBLEM Num. 2 POST POST ASSIGNMENT NUMBERS -- "
    coach_list.each do |c|
      puts "#{c[:name]} -> #{c.student_count}"
    end

    expect(coach_list.first.student_count).to eq 4
    expect(coach_list.second.student_count).to eq 4
    expect(coach_list.third.student_count).to eq 4
end
# PROBLEM 3

end
