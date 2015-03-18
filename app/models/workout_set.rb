class WorkoutSet < ActiveRecord::Base
  belongs_to :workout_exercise

  validates :weight_or_duration, presence: true
  validates :work_units, presence: true
  validates :amount, presence: true
  validates :amount_units, presence: true
end