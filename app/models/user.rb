class User < ActiveRecord::Base
  include Sluggable
  has_secure_password validations: false

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :role, presence: true
  before_save :make_email_lowercase

  has_many :cycles
  belongs_to :team

  sluggable_column :name

  def make_email_lowercase
    self.email = self.email.downcase
  end
end