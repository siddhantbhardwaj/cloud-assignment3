class Student < ApplicationRecord
  # ================
  # = Associations =
  # ================
  has_many :images
  
  # ===============
  # = Validations =
  # ===============
  validates :nickname, presence: true
end
