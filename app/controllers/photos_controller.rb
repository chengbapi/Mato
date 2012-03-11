#coding: utf-8
class PhotosController < ApplicationController
  before_filter :require_user!
  
  def show
    @photo =Photo.find(params[:id])
    @user = @photo.user
  end

  def destroy
   @photo = Photo.find(params[:id]) 
   @user = @photo.user
   @gallery = @photo.gallery
   render_error_page(500) unless current_user == @user
   if @photo.destroy
     flash[:notice] = "成功删除"
     redirect_to [@user,@gallery]
   else
     flash[:error] = "删除失败"
     redirect_back
   end
  end

  def create
    @photo = Photo.new(params[:photo])
     
      @user = User.find(params[:photo][:user_id])
      @photo.user_id = @user.id

     render_error_page(500) && return unless current_user == @user

      if params[:photo][:gallery_id] == 0.to_s
        gallery = @user.galleries.create(:name => "新建相册#{Time.now}",:description => "添加一个描述")
        @photo.gallery_id = gallery.id
      end

    @photo.image = params[:file]
    if @photo.save
      if @photo.gallery.avatar_gallery
       redirect_to avatar_crop_path(@user,:photo_id => @photo.id)
      else  
        flash[:notice] = "相片成功上传"
        redirect_to @photo
      end
    else
       flash[:error] = "上传错误！"
       
       redirect_to upload_user_path
    end
  end

  def crop
    @user = User.find(params[:user_id]) 
    @photo = Photo.find(params[:photo_id])
  end
  
end
