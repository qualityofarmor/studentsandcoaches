# Coach Model
require 'active_record'

class Coach < ActiveRecord::Base
  has_many :students, inverse_of: :coach
end
