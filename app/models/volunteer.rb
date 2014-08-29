class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :events, :join_table => :signups
  validates :name, :presence => true
end
