class Fix < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :project_manager_id
    rename_column :projects, :user_id, :project_manager_id
  end
end
