class CreateCycles < ActiveRecord::Migration
  def change
    create_table :cycles do |t|
      t.integer :user_id, :length_of_time
      t.string :length_of_time_units, :description
      t.date :start_date
      t.timestamps
    end
    create_table :workouts do |t|
      t.integer :cycle_id
      t.string :am_pm
      t.date :date
      t.timestamps
    end
    create_table :workout_exercises do |t|
      t.integer :workout_id, :exercises_id
      t.string :order, :quick_note
      t.timestamps
    end
    create_table :workout_sets do |t|
      t.integer :workout_exercise_id, :weight_or_duration, :amount, :relative_perceived_exertion
      t.string :work_units, :amount_units
      t.timestamps
    end
  end
end
