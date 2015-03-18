class Cycle < ActiveRecord::Base
  belongs_to :user
  has_many :workouts

  validates :length_of_time, presence: true
  validates :length_of_time_units, presence: true
  validates :start_date, presence: true
  validates_uniqueness_of :start_date, scope: :user_id

  def end_date
    start = self.start_date
    time = self.length_of_time
    multi = 1
    if self.length_of_time_units == "Days"
      multi = 1
    else
      multi = 7
    end
    return start + time * multi
  end

  def sort_workouts_for_show
    self.workouts.sort do |x,y|
      if x.date == y.date
        x.am_pm <=> y.am_pm
      else
        x.date <=> y.date
      end
    end
  end
end