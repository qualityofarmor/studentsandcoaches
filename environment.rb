require 'active_record'
require_relative 'lib/student.rb'
require_relative 'lib/coach.rb'
require 'pry'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'db/studentsandcoaches.db'
)

ActiveRecord::Schema.define do
  create_table :coaches, force: true do |t|
    t.string :name
    t.integer :work_ratio
  end

  create_table :students, force: true do |t|
    t.string :name
    t.belongs_to :coach, index: true
  end
end
