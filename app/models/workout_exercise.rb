class WorkoutExercise < ActiveRecord::Base
  belongs_to :workout
  belongs_to :exercise
  has_many :workout_sets, dependent: :destroy

  validates :order, presence: true
  validates_uniqueness_of :order, scope: :workout_id
end