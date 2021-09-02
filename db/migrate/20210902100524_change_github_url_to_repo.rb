class ChangeGithubUrlToRepo < ActiveRecord::Migration[6.1]
  def change
    remove_column :projects, :github_url
    add_column :projects, :repo, :string
  end
end
