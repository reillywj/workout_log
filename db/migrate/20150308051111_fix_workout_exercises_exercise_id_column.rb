class FixWorkoutExercisesExerciseIdColumn < ActiveRecord::Migration
  def change
    rename_column :workout_exercises, :exercises_id, :exercise_id
  end
end
