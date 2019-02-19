# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(name_searched)

    if name_searched.empty?
      Student.all
    else
      Student.all.map  do |student|
        student  if student.name.downcase.include?(name_searched.downcase)
      end.compact
    end
  end


end #end of class
