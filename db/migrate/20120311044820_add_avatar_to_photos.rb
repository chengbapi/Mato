class AddAvatarToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :is_avatar, :boolean ,:defalut => true
  end
end
