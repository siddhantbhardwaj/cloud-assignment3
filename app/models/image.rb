class Image < ApplicationRecord
  # ================
  # = Associations =
  # ================
  belongs_to :student
  
  # ===============
  # = Validations =
  # ===============
  validates :picture_code, :student_id, presence: true
end
