class ChangeNameToProjects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :nome_progetto, :project_name
  end
end
