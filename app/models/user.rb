class User < ActiveRecord::Base
  has_secure_password validations: false

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email, case_sensitive: false
  validates :role, presence: true

  has_many :cycles
  belongs_to :team
end