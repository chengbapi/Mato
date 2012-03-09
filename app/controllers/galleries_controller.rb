class GalleriesController < ApplicationController
  before_filter :require_friends_or_self!
  def show
    @gallery = @user.galleries.find(params[:id]) 
  end

  def edit
    
  end

  def index
    @galleries = @user.galleries.all  
  end

  def new
    @gallery = Gallery.new 
  end

  def destroy
    
  end

  def update
    
  end

  def create
   @gallery = @user.galleries.new(params[:gallery]) 
   @gallery.save!
   redirect_to :action => :index
  end

  private

  def require_friends_or_self!
    begin
      @user = User.find(params[:user_id])
      require_user!
      unless current_user.friend_with?(@user) || current_user == @user 
        render_error_page(500)
      end
    rescue
      render_error_page(404)
    end
  end
end
