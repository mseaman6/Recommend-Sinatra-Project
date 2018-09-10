require_relative './concerns/slugifiable'

class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :presence => true
  validates :category_id, :presence => true


  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
