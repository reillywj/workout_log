class Exercise < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :subcategory_id
  validates_uniqueness_of :nickname, scope: :subcategory_id

  belongs_to :subcategory
  has_many :workout_exercises, dependent: :destroy
end