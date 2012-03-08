class Notification < ActiveRecord::Base
  belongs_to :user


  attr_accessor :sender 
  scope :unread, where(:read => false)


  
end
