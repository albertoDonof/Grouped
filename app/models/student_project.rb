class StudentProject < ApplicationRecord
    belongs_to :project
    belongs_to :student
end