class Photo < ActiveRecord::Base
  attr_accessible :name, :description , :image 
  belongs_to :gallery
  mount_uploader :image , ImageUploader
end
