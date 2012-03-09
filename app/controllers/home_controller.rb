#coding: utf-8
class HomeController < ApplicationController
  
  before_filter :redirect_user, :only => :index
  
  def index
  set_page_attribute("马头网，中国领先的xx网络","登录")
      redirect_to new_session_path('user')
  end

  def about_us
    set_page_attribute("About Us","关于我们")
    render :template => "statics/about_us.html.erb", :layouts => "application"
    
  end


  private

    def redirect_user
      redirect_to home_user_path(current_user) if user_signed_in?
    end



end
