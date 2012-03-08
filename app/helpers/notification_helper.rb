#coding: utf-8
module NotificationHelper
  
  def show_notification(notice)
    @send = notice.sender
    html =
    case notice.content
      when "invite" then  
         "接收到来自" <<
         link_to(@send.name,user_path(@send)) <<
         "的好友邀请，你可以"  <<
         link_to("接受",accept_friendships_path(:friend_id => @send.id),:method => :put) <<
         "或者拒绝" 
      when "accept" then 
          link_to(@send.name,@send) + "已经接受了你的好友邀请"
      when "messege" then
          link_to(@send.name,@send) + "给你发布了一条" + link_to("留言",user_messeges_path(current_user))
    end
    
    html = "" if html.nil?
    html.html_safe
    
  end


end
