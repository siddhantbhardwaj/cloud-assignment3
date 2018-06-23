class CreateImages < ActiveRecord::Migration[5.1]
  def change
    create_table :images do |t|
      t.integer :student_id
      t.text :picture_code
      t.timestamps
    end
  end
end
