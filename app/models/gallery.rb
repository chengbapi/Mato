class Gallery < ActiveRecord::Base
  attr_accessible :name,:description ,:avatar_gallery
  belongs_to :user
  has_many :photos
  
  m
end
