class AnotherFix < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :project_manager_id, :user_id

  end
end
