class AddRoleMask < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :roles_mask1, :integer
    add_column :users, :roles_mask2, :integer

  end
end
