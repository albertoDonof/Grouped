class Project < ApplicationRecord
    validates :project_name, presence: true, uniqueness: true 
    validates :exams, presence: true
    has_many :user_projects, :dependent => :delete_all
    has_many :users, through: :user_projects
    has_many :exam_projects
    has_many :exams, through: :exam_projects
end