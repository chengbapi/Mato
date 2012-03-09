class ApplicationController < ActionController::Base

  protect_from_forgery



  def set_page_attribute(title='',description='')
    @title = title
    @description = description
  end

  def require_user!
     if not user_signed_in?
       authenticate_user!
     end
  end

  def redirect_back
    redirect_to(request.referrer || root_path)
  end

  def render_error_page(status_code=404)
    status = status_code.to_s
    if ["404","403", "422", "500"].include?(status)
      render :template => "/errors/#{status}.html.erb", :status => status, :layout => "application"
    else
      render :template => "/errors/unknown.html.erb", :status => status, :layout => "application"
    end
   
  end


end
