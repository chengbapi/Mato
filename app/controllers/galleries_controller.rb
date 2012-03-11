#coding: utf-8
class GalleriesController < ApplicationController
  before_filter :require_user!
  before_filter :need_to_be_self , :except => [:upload,:show,:index]
  def show
    @gallery = Gallery.find(params[:id]) 
    @user = @gallery.user
    unless current_user.friend_with?(@user) || current_user == @user 
       render_error_page(500)
    end
  end

  def edit
  end

  def index
    @user = User.find(params[:user_id])
    unless current_user.friend_with?(@user) || current_user == @user 
       render_error_page(500)
    end
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
   if @gallery.id == 0
     @gallery.id = Gallery.new.id
   end
   if @gallery.save
    redirect_to :action => :index
   else
     redirect_back
   end
  end

  def upload
    @user = User.find(params[:id])
    @gallery = Gallery.new
    gid = params[:fast_upload] || 0
    @photo = @user.photos.new(:gallery_id => gid)
    if gid == 0
      @album_array = @user.galleries.all.collect { |g| [g.name,g.id]}.push(["新建相册#{Time.now}",0]) 
    elsif Gallery.find(gid).avatar_gallery
     @album_array = [["头像相册",gid]]
     @photo.is_avatar = true
    else
      @album_array = @user.galleries.all.collect { |g| [g.name,g.id]}
    end


 end

  def avatar_gallery
    @user = User.find(params[:id])
    unless current_user.friend_with?(@user) || current_user == @user 
       render_error_page(500)
    end
    if @user.avatar_gallery.blank?
      @gallery = @user.galleries.create(:name => "头像相册",:description => "这是你的头像相册",:avatar_gallery => true)
    else
      @gallery = @user.avatar_gallery
    end
    render :action => :show
  end

  private

  def need_to_be_self
    @user = User.find(params[:user_id] || params[:id])
    unless current_user == @user 
       render_error_page(500)
    end

  end

  
end
