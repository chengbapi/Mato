#coding: utf-8
class Messege < ActiveRecord::Base

  after_save :create_notification

  belongs_to :user
  belongs_to :receiver, :class_name => 'User'

  has_many :replies , :as => :subject

  validates_presence_of :user_id, :receiver_id
  validates_length_of :content, :within => 4..800

  private

  def create_notification
    @notice = Notification.new(:user_id => receiver_id,:send_id => user_id,:content => "messege") 
     unless @notice.save
       logger.warn "留言创建失败！" 
     end
  end
end
