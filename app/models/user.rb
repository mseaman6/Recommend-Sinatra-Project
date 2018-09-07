class User < ActiveRecord::Base
  has_secure_password

  has_many :recommendations
  has_many :categories, through: :recommendations

  validates :username, :presence => true
  validates :email, :presence => true
  validates :password, :presence => true

end
