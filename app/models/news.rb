class News < ActiveRecord::Base

  belongs_to :user

  has_many :replies, :as => :subject

  validates_presence_of :content, :user_id
end
