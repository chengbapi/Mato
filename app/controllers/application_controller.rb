class ApplicationController < ActionController::Base


  protect_from_forgery



  def set_page_attribute(title='',description='')
    @title = title
    @description = description
  end

  def require_user
     if user_signed_in?
       authenticate_user!
     end
  end

  def redirect_back
    redirect_to(request.referrer || root_path)
    
  end
end
