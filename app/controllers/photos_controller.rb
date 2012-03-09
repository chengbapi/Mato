#coding: utf-8
class PhotosController < ApplicationController

  def show
    @gallery = Gallery.find(params[:gallery_id])
    @photo =  @gallery.photos.find(params[:id])
  end

  def new
    @gallery = Gallery.find(params[:gallery_id])
    @photo = @gallery.photos.new(:name => "快速上传",:description => "在这里加入照片的描述 ")    
  end

  def destroy
    
  end

  def update
    
  end

  def create
    @gallery = Gallery.find(params[:gallery_id])
   @photo =  @gallery.photos.new(params[:photo])
   @photo.image = params[:file]
   if @photo.save
    redirect_to [@gallery,@photo]
   end
  end
 
end
