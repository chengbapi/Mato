#coding: utf-8
class PhotosController < ApplicationController
  before_filter :require_user!
  def show
    @photo =Photo.find(params[:id])
    @user = @photo.user
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(:name => "快速上传",:description => "在这里加入照片的描述 ")    
    @user = @gallery.user
  end

  def destroy
    
  end

  def update
    
  end

  def create
    @photo = Photo.new(params[:photo])
    @user = User.find(params[:photo][:user_id])
    @photo.user_id = @user.id
    if params[:photo][:gallery_id] == 0.to_s
      gallery = @user.galleries.create(:name => "新建相册#{Time.now}",:description => "添加一个描述")
      @photo.gallery_id = gallery.id
    end
   @photo.image = params[:file]
   if @photo.save
    redirect_to @photo
   end
  end
  
  private 

end
