#coding: utf-8
class UsersController < ApplicationController
  before_filter :require_user!
  def show
    @user = User.find(params[:id])
    @news = News.new
    @message = Messege.new(:content => "对朋友说点什么吧")
    if not current_user == @user
      current_user.visit(@user)
    end
     set_page_attribute(@user.name,"个人主页")
  end

  def friends
    @user = User.find(params[:id])
    @friends = @user.friends
    @pending_friends = @user.pending_friends
    @requested_friends = @user.requested_friends

    set_page_attribute("我的好友","好友")

  end

#  def news
#    #这个news是个人主页下的news
#    @user = User.find(params[:id])
#    @news = @user.news
#  end

  def home
    #这里的news是首页里面的news
    if current_user == User.find(params[:id])
       @user = current_user
       @message = Messege.new(:content => "对朋友说点什么吧")
       @news = News.new
       set_page_attribute("新鲜事","新鲜事")
     else
       redirect_to :action => :show
     end
  end
end
