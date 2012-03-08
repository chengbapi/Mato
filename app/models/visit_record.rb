class VisitRecord < ActiveRecord::Base
  belongs_to :user
  belongs_to :visit , :class_name => 'User'
end
