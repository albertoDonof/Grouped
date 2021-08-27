class RemoveRegistrationNumber < ActiveRecord::Migration[6.1]
  def change
    remove_column :students, :registration_number
  end
end
