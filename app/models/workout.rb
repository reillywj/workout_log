class Workout < ActiveRecord::Base
  belongs_to :cycle
  has_many :workout_exercises, dependent: :destroy

  validates :date, presence: true
  validates :am_pm, presence: true
end