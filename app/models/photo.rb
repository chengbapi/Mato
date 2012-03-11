class Photo < ActiveRecord::Base


  attr_accessible :name, :description , :image ,:gallery_id ,:user_id 
  belongs_to :gallery
  belongs_to :user
  mount_uploader :image , ImageUploader

  private 
end
