class FixRolesMask < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :roles_mask1
    remove_column :users, :roles_mask2
    add_column :users, :roles_mask, :integer

  end
end
