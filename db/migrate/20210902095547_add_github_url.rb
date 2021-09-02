class AddGithubUrl < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :github_url, :text
  end
end
