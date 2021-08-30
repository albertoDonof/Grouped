class AddToExamProjectNull < ActiveRecord::Migration[6.1]
  def change
    change_column :exam_projects, :project_id, :integer, null: true
  end
end
