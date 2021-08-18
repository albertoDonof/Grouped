class ExamProject < ApplicationRecord
    belongs_to :project
    belongs_to :exam
end