class AddOnCascadeToExamProjectNull < ActiveRecord::Migration[6.1]
  def change
    remove_foreign_key :exam_projects, :projects
    add_foreign_key :exam_projects, :projects, on_delete: :nullify
  end
end
