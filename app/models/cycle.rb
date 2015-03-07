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
end