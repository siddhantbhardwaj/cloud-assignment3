class Student < ApplicationRecord
  # ================
  # = Associations =
  # ================
  has_many :images
  
  # ===============
  # = Validations =
  # ===============
  validates :student_id, presence: true, length: { is: 3 }, numericality: { only_integer: true }
  validates :nickname, presence: true, length: { maximum: 6 }
end
