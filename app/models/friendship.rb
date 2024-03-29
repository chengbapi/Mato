class Friendship < ActiveRecord::Base
  belongs_to :user
  belongs_to :friend, :class_name => 'User'
  belongs_to :blocker, :class_name => 'User'

  validates_presence_of :user_id, :friend_id
  validates_uniqueness_of :friend_id, :scope => :user_id

  def approved?
    approved
  end

  def blocked?
    blocked
  end
  
end
