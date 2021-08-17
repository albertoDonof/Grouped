class AddDescriptionToExams < ActiveRecord::Migration[6.1]
  def change
    add_column :exams, :description, :text
  end
end
