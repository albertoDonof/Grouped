class Exam < ApplicationRecord
    validates :name, :code, presence: true, uniqueness: true
    has_many :user_exams
    has_many :users, through: :user_exams
    has_many :exam_projects
    has_many :projects, through: :exam_projects
end