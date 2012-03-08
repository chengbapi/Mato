class Reply < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject, :polymorphic => true


  def set_class
    messege_id = id
    self.save
  end
end
