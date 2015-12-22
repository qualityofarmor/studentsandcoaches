require 'active_record'

class Coach < ActiveRecord::Base
  has_many :students, inverse_of: :coach

  public

  def initialize(attributes = nil)
    super(attributes)
    @student_roster = []
  end

  def student_count
    @student_roster.count
  end

  def add_student(new_student)
    @student_roster << new_student
    new_student.coach = self
    new_student.save
  end

end
