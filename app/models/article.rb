class Article < ActiveRecord::Base
  belongs_to :users
  has_many :replies ,:as => :subject
  validates_presence_of :title, :content, :user_id
  validates_length_of :title, :within => 2..50
  validates_length_of :content, :within => 5..5000
end
