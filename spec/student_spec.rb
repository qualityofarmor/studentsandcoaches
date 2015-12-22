describe Student do
  it 'saves to the database' do
    student = Student.create({name: 'Ziggy Stardust'})
    student_record = Student.where(name: 'Ziggy Stardust').first
    expect(student_record[:name]).to eq 'Ziggy Stardust'
  end

  it 'has a name' do
    student = Student.create({name: 'The One Armed Man'})
    expect(student[:name]).to eq 'The One Armed Man'
  end

  it 'is affiliated with a coach' do
    coach = Coach.create({name: 'Coach Jagger'})
    student = Student.create({name: 'Mark Bolan'})
    coach.add_student(student)
    coach.save
    student.save
    expect(student.coach[:name]).to eq 'Coach Jagger'
  end
end
