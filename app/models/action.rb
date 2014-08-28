class Action < ActiveRecord::Base
  has_and_belongs_to_many :volunteers, :join_table => :signups
  validates :name, :presence => true
end
