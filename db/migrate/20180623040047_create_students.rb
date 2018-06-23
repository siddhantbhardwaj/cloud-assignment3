class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.float :student_id, scale: 3
      t.text :nickname, limit: 6 
      t.timestamps
    end
  end
end
