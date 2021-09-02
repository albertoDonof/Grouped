class RemoveForeignKey < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :exam_projects, :exams
    remove_foreign_key :user_exams, :exams
    add_foreign_key :exam_projects, :exams
    add_foreign_key :user_exams, :exams
  end
end
