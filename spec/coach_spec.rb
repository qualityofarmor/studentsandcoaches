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

  it 'is assigned students in accordance with a collective and even distribution' do
      coach_one = Coach.create!(name: 'Coach Halford')
      coach_two = Coach.create!(name: 'Coach Pollard')
      coach_three = Coach.create!(name: 'Coach Danzig')
      coach_list = [coach_one, coach_two, coach_three]

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


end
