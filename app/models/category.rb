require_relative './concerns/slugifiable'

class Category < ActiveRecord::Base
  has_many :users, through: :recommendations
  has_many :recommendations

  validates :name, :presence => true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
