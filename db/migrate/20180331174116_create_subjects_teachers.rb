class CreateSubjectsTeachers < ActiveRecord::Migration[5.0]
  def change
    create_table :subjects_teachers do |t|
      t.integer :subject_id
      t.integer :teacher_id
    end
  end
end
