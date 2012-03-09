#coding: utf-8
class NotificationsController < ApplicationController

  before_filter :require_user!
  def index
    @notifications = current_user.notifications
    @notifications.each do |notice|
      notice.sender = User.find(notice.send_id)
    end
    set_page_attribute("你有#{@notifications.count}个新消息","提醒新事件")
    current_user.read_notifications(@notifications)
  end

  def destroy

  end

end
