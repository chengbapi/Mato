#coding: utf-8
class HomeController < ApplicationController
  before_filter :redirect_user, :only => :index
  def index
  set_page_attribute("马头网，中国领先的xx网络","登录")
      redirect_to new_session_path('user')
  end

  private

    def redirect_user
      redirect_to home_user_path(current_user) if user_signed_in?
    end



end
