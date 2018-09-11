require_relative './concerns/slugifiable'

class User < ActiveRecord::Base
  has_secure_password

  has_many :recommendations
  has_many :categories, through: :recommendations

  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

  validates :username, uniqueness: true
  validates :email, :uniqueness => true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
