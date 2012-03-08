#coding: utf-8
class NewsController < ApplicationController
  def create
    @news = current_user.news.build(params[:news])
    if @news.save
      flash[:notice] = "发布成功"
      redirect_to user_path(current_user)
    else
      flash[:error] = "发布出错"
      render user_path(current_user)
    end
  end
end
