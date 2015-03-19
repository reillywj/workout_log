class Category < ActiveRecord::Base
  validates :name, presence: true
  validates_uniqueness_of :name

  has_many :subcategories, dependent: :destroy
  has_many :exercises, through: :subcategories

  belongs_to :team

  def self.for_select
    self.all.sort{|x,y| x.name <=> y.name}.map{|x| [x, x.exercises.map{|y| [y.name, y.id]}]}
  end

  def self.for_group_select
    self.all.sort{|x,y| x.name <=> y.name}
  end
end