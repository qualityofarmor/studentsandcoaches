describe Coach do
  it 'saves to the database' do
    coach = Coach.new(name: 'Coach Chilton')
    coach.save
    coach_record = Coach.where(name: 'Coach Chilton').first
    expect(coach_record[:name]).to eq 'Coach Chilton'
  end

  it 'has a name' do
    coach = Coach.new(name: 'Coach Mould')
    coach.save
    expect(coach[:name]).to eq 'Coach Mould'
  end
end
