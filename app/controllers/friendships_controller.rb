#coding: utf-8
class FriendshipsController < ApplicationController
  before_filter :find_the_friend
  
  def create
    if current_user.invite(@friend)
      flash[:notice] = "已经成功添加邀请."
      add_notification("invite")
      redirect_to current_user
    else
      flash[:alert] = "添加失败."
      redirect_to current_user
    end
  end

  def accept
    if current_user.invited_by? @friend
      flash[:notice] = "#{@friend.name} 已经成功添加为好友"
      add_notification("accept")
      current_user.approve(@friend)
      redirect_back
    else
      flash[:alert] = "提交错误！"
      redirect_back
    end
    
  end

  def destroy
    flash[:notice] = "Removed friendship."
    redirect_to current_user
  end

  private

  def find_the_friend
    @friend = User.find(params[:friend_id]) 
  end

  def add_notification(type = "invite")
    Notification.create(:user_id => @friend.id, :content => type, :send_id => current_user.id  )
  end

end
