class CycleForm < ActionForm::Base
  self.main_model = :cycle
  attributes :start_date, :description, :length_of_time, :length_of_time_units

  association :workouts do
    attributes :am_pm, :date
  end
end