class Student < ApplicationRecord
  # ================
  # = Associations =
  # ================
  has_many :images
  
  # ===============
  # = Validations =
  # ===============
  validates :student_id, presence: true, length: {minimum: 3, maximum: 3}
  validates :nickname, presence: true
end
