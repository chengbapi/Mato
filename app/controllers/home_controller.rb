#coding: utf-8
class HomeController < ApplicationController
  def index
    if user_signed_in?
      redirect_to news_user_path(current_user)
    else
      set_page_attribute("马头网，中国领先的xx网络","登录")
      redirect_to new_session_path('user')
    end
  end
end
