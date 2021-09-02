class ForeignKeyExamProjects < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :exam_projects, :exams
    add_foreign_key :exam_projects, :exams, on_delete: :cascade
  end
end
