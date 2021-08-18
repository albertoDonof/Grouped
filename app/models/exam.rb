class Exam < ApplicationRecord
    validates :name, :code, presence: true, uniqueness: true
    has_many :student_exams
    has_many :students, through: :student_exams
    has_many :exam_projects
    has_many :projects, through: :exam_projects
end