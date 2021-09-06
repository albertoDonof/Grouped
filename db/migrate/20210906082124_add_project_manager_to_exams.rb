class AddProjectManagerToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :project_manager_id, :integer
  end
end
