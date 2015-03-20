class Team < ActiveRecord::Base
  include Sluggable
  has_many :users
  has_many :categories

  validates :name, presence: true, uniqueness: true
  validates :location, presence: true

  sluggable_column :name
end