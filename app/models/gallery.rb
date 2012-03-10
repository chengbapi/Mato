class Gallery < ActiveRecord::Base
  attr_accessible :name,:description 
  belongs_to :user
  has_many :photos

  end
