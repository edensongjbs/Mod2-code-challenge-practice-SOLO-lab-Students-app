class Instructor < ApplicationRecord
    has_many :students

    def student_avg_age
        unless self.students.count==0
            (self.students.reduce(0) {|sum, student| sum += student.age}/self.students.count).to_i
        else
            "No Students!"
        end
    end

    def alphabetized_students
        self.students.sort{|s1, s2| s1.name <=> s2.name }
    end
end
