class ChangeStudentInUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :students, :student_id, :integer
  end
end
