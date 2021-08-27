class Project < ApplicationRecord
    validates :project_name, presence: true, uniqueness: true 
    validates :exams, presence: true
    has_many :student_projects
    has_many :students, through: :student_projects
    has_many :exam_projects
    has_many :exams, through: :exam_projects
end