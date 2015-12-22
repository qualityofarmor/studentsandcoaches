require 'active_record'

class Student < ActiveRecord::Base
  belongs_to :coach, inverse_of: :students
end
