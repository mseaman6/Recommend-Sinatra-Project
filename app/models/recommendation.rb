class Recommendation < ActiveRecord::Base
  belongs_to :user
  belongs_to :category

  validates :title, :presence => true

  extend Slugifiable::ClassMethods
  include Slugifiable::InstanceMethods
end
