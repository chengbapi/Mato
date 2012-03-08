#coding: utf-8
module UserHelper
  def is_current_user?
    current_user.eql? @user
  end

  def show_last_news
    @new = 
      if @user.last_post_news.nil?   
        "尚未发布状态"  
      else
        @user.last_post_news.content
      end
    
    "最新状态：#{@new}"
  end

  def add_friend_button(friend)

    html = 
    if current_user.find_any_friendship_with(friend).nil?
     button_to "加为好友",friendships_path(:friend_id => friend.id),
                  :class => "uibutton icon add"
    else
      if  current_user.invited_by? friend
        button_to("同意加为好友",accept_friendships_path(:friend_id => friend.id), :class => "uibutton icon add")
      elsif current_user.invited? friend
        "正在等待 #{link_to friend.name, user_path(friend)} 的回应"
      else
        "已经是你的好友"
      end
    end
    return "" if html.nil?
    html.html_safe
  end
end
