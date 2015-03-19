class Team < ActiveRecord::Base
  has_many :users
  has_many :categories

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
end