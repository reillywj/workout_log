class Category < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :subcategories, dependent: :destroy
end