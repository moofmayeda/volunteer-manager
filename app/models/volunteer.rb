class Volunteer < ActiveRecord::Base
  has_and_belongs_to_many :events, :join_table => :signups
  validates :name, :presence => true

  def event_num
    self.events.count
  end
end
