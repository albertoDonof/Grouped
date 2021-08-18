class CreateExamProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :exam_projects do |t|
      t.references :project, null: false, foreign_key: true
      t.references :exam, null: false, foreign_key: true
      t.timestamps
    end
  end
end
