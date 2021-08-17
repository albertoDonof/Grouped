class Exam < ApplicationRecord
    validates :name, :code, presence: true, uniqueness: true
    has_many :student_exams
    has_many :students, through: :student_exams
end