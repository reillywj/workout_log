class WorkoutForm < ActionForm::Base
  self.main_model = :workout
  attributes :date, :am_pm

  association :workout_exercises do
    attributes :order, :quick_note, :exercise_id

    association :workout_sets do
      attributes :weight_or_duration, :amount, :relative_perceived_exertion, :work_units, :amount_units, :completion
    end
  end
end