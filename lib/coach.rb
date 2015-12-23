require 'active_record'

class Coach < ActiveRecord::Base
  has_many :students, inverse_of: :coach

  public

  def initialize(attributes = nil)
    super(attributes)
    @student_roster = []
    @work_ratio = nil
  end

  def student_count
    @student_roster.count
  end

  def add_student(new_student)
    @student_roster << new_student
    new_student.coach = self
    new_student.save
  end

  def add_work_ratio(new_ratio)
    @work_ratio = new_ratio
  end

  def work_ratio_percentage
    @work_ratio / (100.to_f)
  end

end
