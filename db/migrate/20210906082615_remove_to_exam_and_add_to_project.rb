class RemoveToExamAndAddToProject < ActiveRecord::Migration[6.1]
  def change
    remove_column :exams, :project_manager_id

    add_column :projects, :project_manager_id, :integer

  end
end
