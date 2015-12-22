describe Student do
  it 'saves to the database' do
    student = Student.new(name: 'Ziggy Stardust')
    student.save
    student_record = Student.where(name: 'Ziggy Stardust').first
    expect(student_record[:name]).to eq 'Ziggy Stardust'
  end


  it 'has a name' do
    student = Student.new(name: 'The One Armed Man')
    student.save
    expect(student[:name]).to eq 'The One Armed Man'
  end
end
