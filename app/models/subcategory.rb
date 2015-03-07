class Subcategory < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name, scope: :category_id
  validates_uniqueness_of :rank, scope: :category_id
  
  belongs_to :category
  has_many :exercises, dependent: :destroy
end