class AddRolesMaskToStudents < ActiveRecord::Migration[6.1]
  def change
    add_column :students, :roles_mask, :integer
  end
end
