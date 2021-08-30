class ChangeColumnAssociation < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_exams, :student_id, :user_id
    rename_column :user_projects, :student_id, :user_id


  end
end
