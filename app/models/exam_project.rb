class ExamProject < ApplicationRecord
    belongs_to :project, :dependent => :delete
    belongs_to :exam, :dependent => :delete
end