class ChangeTablesNames < ActiveRecord::Migration[6.1]
  def change
    rename_table :student_exams, :user_exams
    rename_table :student_projects, :user_projects

  end
end
