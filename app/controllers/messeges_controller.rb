#coding: utf-8
class MessegesController < ApplicationController
  before_filter :require_user

   def index
     @user = User.find(params[:user_id])
     @messeges = @user.received_messeges.order('created_at DESC').all
     set_page_attribute("留言板","留言")
   end


   def destroy
     
   end

   def create
    @messege = Messege.new(params[:messege])
    @messege.user_id = current_user.id
    @messege.receiver_id = params[:user_id]
    if @messege.save
      flash[:notice] = "成功添加留言"
      redirect_back
    else
      flash[:alert] = "留言添加失败！留言需要字数多于4个字"
      redirect_back
    end

   end
  
end
